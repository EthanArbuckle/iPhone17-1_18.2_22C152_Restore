@interface WCM_PlatformManager
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40ARange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40BRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A1Range;
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A2Range;
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7DLRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7ULRange;
- (BOOL)coexSupported;
- (BOOL)fetchWRMdebugPlistForceTDD;
- (BOOL)forceWiFiBTCoexToTDD;
- (BOOL)iRATSupported;
- (BOOL)is3FoForFreq:(double)a3 bw:(double)a4 resultantFreq:(double)a5 resultantBW:(double)a6;
- (BOOL)isBand40ACoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6;
- (BOOL)isBand40BCoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6;
- (BOOL)isBand41A1CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6;
- (BOOL)isBand41A2CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6;
- (BOOL)isBand7CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6;
- (BOOL)isIMD2ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8;
- (BOOL)isIMD3ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8;
- (BOOL)isJapanSKU;
- (BOOL)isRowSKUB;
- (BOOL)isRowSKUS;
- (BOOL)loggingToFileEnabled;
- (BOOL)wcmBTSupportTDDFrameConfig;
- (BOOL)wcmWiFiSupportFrameConfig;
- (BOOL)wcmWiFiSupportWciSignalingConfig;
- (NSArray)wcmCellularScanProtectionCellFrequencies;
- (NSArray)wcmCellularScanProtectionCellFrequenciesforBT;
- (NSArray)wcmCellularScanProtectionWiFiChannels;
- (NSArray)wcmCellularScanProtectionWiFiChannelsWiFiEnh;
- (NSArray)wcmWiFiAntennaConfig;
- (NSArray)wcmWiFiAntennaConfigDefault;
- (NSArray)wcmWiFiB40ABlocklistChannels;
- (NSArray)wcmWiFiB40AWCI2EnabledChannels;
- (NSArray)wcmWiFiB40BBlocklistChannels;
- (NSArray)wcmWiFiB40BWCI2EnabledChannels;
- (NSArray)wcmWiFiB41A1BlocklistChannels;
- (NSArray)wcmWiFiB41A1WCI2EnabledChannels;
- (NSArray)wcmWiFiB41A2BlocklistChannels;
- (NSArray)wcmWiFiB41A2WCI2EnabledChannels;
- (NSArray)wcmWiFiB7BlocklistChannels;
- (NSArray)wcmWiFiB7WCI2EnabledChannels;
- (NSArray)wcmWiFiScanThrottlingChannelIndices;
- (NSData)wcmBTAFHMapDefault;
- (NSData)wcmBTB40AAFHMap;
- (NSData)wcmBTB40BAFHMap;
- (NSData)wcmBTB41A1AFHMap;
- (NSData)wcmBTB41A2AFHMap;
- (NSData)wcmBTB7AFHMap;
- (NSData)wcmHFBTChannelMapDefault;
- (NSData)wcmHPCellularBTAFHMapFixed;
- (NSDictionary)wcmBTAntBlockEnableBandsDefault;
- (NSDictionary)wcmGen9rFemDefaultMode2gWiFiCellularbands;
- (NSDictionary)wcmGen9rFemDefaultMode5gWiFiCellularbands;
- (NSDictionary)wcmWiFiBTCoexProfileClamshell;
- (NSDictionary)wcmWiFiBTCoexProfileDefault;
- (NSDictionary)wcmWiFiBTCoexProfileDefault5G;
- (NSDictionary)wcmWiFiBTCoexProfileHPP;
- (NSDictionary)wcmWiFiBTCoexProfileHPPHeavy;
- (NSDictionary)wcmWiFiBTCoexProfileHeavy;
- (NSDictionary)wcmWiFiBTCoexProfileHeavyA2DP;
- (NSDictionary)wcmWiFiBTCoexProfileHeavyHFP;
- (NSDictionary)wcmWiFiBTCoexProfileHeavyLEA;
- (NSDictionary)wcmWiFiBTCoexProfileLight;
- (NSDictionary)wcmWiFiBTCoexProfileTDD;
- (NSDictionary)wcmWiFiBTCoexProfileThreadHybrid;
- (NSDictionary)wcmWiFiBTCoexProfileUSB3Desense;
- (NSMutableSet)wcmCoexFeatures;
- (NSNumber)wcmBTAntBlockDuration;
- (NSNumber)wcmBTAntennaConfig;
- (NSNumber)wcmBTAntennaConfigNonCoex;
- (NSNumber)wcmBTAntennaConfigParam1;
- (NSNumber)wcmBTAntennaConfigParam1NonCoex;
- (NSNumber)wcmBTAntennaConfigParam2;
- (NSNumber)wcmBTAntennaConfigParam2NonCoex;
- (NSNumber)wcmBTDefaultAntenna;
- (NSNumber)wcmBTDefaultAntennaNonCoex;
- (NSNumber)wcmBTMaxNumberOfChannelsToAvoidForCellOOB;
- (NSNumber)wcmBTPreferredRole;
- (NSNumber)wcmCellularScanProtectionWiFiMaxDuration;
- (NSNumber)wcmCellularWCI2ModeAPTTable;
- (NSNumber)wcmCellularWCI2ModeControllerLTEPowerLimitingEnable;
- (NSNumber)wcmCellularWCI2ModeControllerLTERBThreshold;
- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimit;
- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimitTO;
- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdHigh;
- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdLow;
- (NSNumber)wcmCellularWCI2ModeFrameDenialWindow;
- (NSNumber)wcmCellularWCI2ModeLTEHarqnackratioThreshold;
- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerHigh;
- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerLow;
- (NSNumber)wcmCellularWCI2ModeLTETxDenial;
- (NSNumber)wcmCellularWCI2ModeLinkPathLossThreshold;
- (NSNumber)wcmCellularWCI2ModeMaxAllowedFrameDenials;
- (NSNumber)wcmCellularWCI2ModePolicy;
- (NSNumber)wcmCellularWCI2ModePowerThreshold;
- (NSNumber)wcmCellularWCI2ModeRBFilerAlpha;
- (NSNumber)wcmCellularWCI2ModeRBThresholdAdvTx;
- (NSNumber)wcmCellularWCI2ModeRBThresholdHigh;
- (NSNumber)wcmCellularWCI2ModeRBThresholdLow;
- (NSNumber)wcmCellularWCI2ModeTxPowerThresholdAdvTx;
- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimit;
- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimitTO;
- (NSNumber)wcmWiFiActiveDwellTime;
- (NSNumber)wcmWiFiActiveScanThrottleMask;
- (NSNumber)wcmWiFiAntennaCellPolicy;
- (NSNumber)wcmWiFiAntennaCellPolicyDefault;
- (NSNumber)wcmWiFiEnvelopeIndicationTimer;
- (NSNumber)wcmWiFiEnvelopeOnIndication;
- (NSNumber)wcmWiFiPriThresholdHigh;
- (NSNumber)wcmWiFiPriThresholdLow;
- (NSNumber)wcmWiFiPriThresholdMed;
- (NSNumber)wcmWiFiRxProtectAutoParamThresh;
- (NSNumber)wcmWiFiRxProtectAutoParamWeight;
- (NSNumber)wcmWiFiRxProtectMode;
- (NSNumber)wcmWiFiScanJoinProtectDuration;
- (NSNumber)wcmWiFiTxOnIndication;
- (NSNumber)wcmWiFiWCI2TxDurationThresh;
- (WCM_CellularRc1CoexIssueTable)wcmCellRc1CoexIssueTable;
- (WCM_PlatformManager)init;
- (WCM_WiFiCellCoexIssueBandTable)wcmWiFiCellCoexIssueTable;
- (int)wrmPlatformId;
- (int)wrmSku;
- (int64_t)wcmWCI2FrameSyncAssertOffset;
- (int64_t)wcmWCI2MWSInactivityAssertOffset;
- (int64_t)wcmWCI2MWSPatternAssertOffset;
- (int64_t)wcmWCI2MWSRxAssertOffset;
- (int64_t)wcmWCI2MWSRxDeAssertOffset;
- (int64_t)wcmWCI2MWSScanFrequencyAssertOffset;
- (int64_t)wcmWCI2MWSTxAssertOffset;
- (int64_t)wcmWCI2MWSTxDeAssertOffset;
- (unint64_t)getBand40AUlBw;
- (unint64_t)getBand40AUlCenterFreq;
- (unint64_t)getBand40BUlBw;
- (unint64_t)getBand40BUlCenterFreq;
- (unint64_t)getBand41A1UlBw;
- (unint64_t)getBand41A1UlCenterFreq;
- (unint64_t)getBand41A2UlBw;
- (unint64_t)getBand41A2UlCenterFreq;
- (unint64_t)wcmBTWCI2ModeRecvMsgBitmap;
- (unint64_t)wcmBTWCI2ModeSendMsgBitmap;
- (unint64_t)wcmCellularLAACoexDeactStopTimer;
- (unint64_t)wcmCellularLAACoexDeactTimer;
- (unint64_t)wcmCellularLAACoexProtectCQIPeriod;
- (unint64_t)wcmCellularLAACoexThresholdIn;
- (unint64_t)wcmCellularLAACoexThresholdOut;
- (unint64_t)wcmCellularWCI2PlatformPolicyBitmap;
- (unint64_t)wcmWCI2FrameSyncAssertJitter;
- (unint64_t)wcmWCI2MWSInactivityAssertJitter;
- (unint64_t)wcmWCI2MWSPatternAssertJitter;
- (unint64_t)wcmWCI2MWSPriorityAssertOffsetRequest;
- (unint64_t)wcmWCI2MWSRxAssertJitter;
- (unint64_t)wcmWCI2MWSRxDeAssertJitter;
- (unint64_t)wcmWCI2MWSScanFrequencyAssertJitter;
- (unint64_t)wcmWCI2MWSTxAssertJitter;
- (unint64_t)wcmWCI2MWSTxDeAssertJitter;
- (void)configureSupportedPlatform;
- (void)dealloc;
- (void)enableLegacyCoexFeature;
- (void)initPlatformPolicies;
- (void)loadBTConfigurablePolicy:(id)a3;
- (void)loadCellularConfigurablePolicy:(id)a3;
- (void)loadCoexConfigurablePolicy;
- (void)loadConfigurableActiveFeature:(id)a3;
- (void)loadStaticPolicyFor:(int)a3;
- (void)loadWiFiConfigurablePolicy:(id)a3;
- (void)printPlatformConfig;
- (void)setCoexSupported:(BOOL)a3;
- (void)setForceWiFiBTCoexToTDD:(BOOL)a3;
- (void)setIRATSupported:(BOOL)a3;
- (void)setLoggingToFileEnabled:(BOOL)a3;
- (void)setPlatform;
- (void)setSKU;
- (void)setWcmBTAFHMapDefault:(id)a3;
- (void)setWcmBTAntBlockDuration:(id)a3;
- (void)setWcmBTAntBlockEnableBandsDefault:(id)a3;
- (void)setWcmBTAntennaConfig:(id)a3;
- (void)setWcmBTAntennaConfigNonCoex:(id)a3;
- (void)setWcmBTAntennaConfigParam1:(id)a3;
- (void)setWcmBTAntennaConfigParam1NonCoex:(id)a3;
- (void)setWcmBTAntennaConfigParam2:(id)a3;
- (void)setWcmBTAntennaConfigParam2NonCoex:(id)a3;
- (void)setWcmBTB40AAFHMap:(id)a3;
- (void)setWcmBTB40BAFHMap:(id)a3;
- (void)setWcmBTB41A1AFHMap:(id)a3;
- (void)setWcmBTB41A2AFHMap:(id)a3;
- (void)setWcmBTB7AFHMap:(id)a3;
- (void)setWcmBTDefaultAntenna:(id)a3;
- (void)setWcmBTDefaultAntennaNonCoex:(id)a3;
- (void)setWcmBTMaxNumberOfChannelsToAvoidForCellOOB:(id)a3;
- (void)setWcmBTPreferredRole:(id)a3;
- (void)setWcmBTSupportTDDFrameConfig:(BOOL)a3;
- (void)setWcmBTWCI2ModeRecvMsgBitmap:(unint64_t)a3;
- (void)setWcmBTWCI2ModeSendMsgBitmap:(unint64_t)a3;
- (void)setWcmCellRc1CoexIssueTable:(id)a3;
- (void)setWcmCellularCoexB40ARange:(id)a3;
- (void)setWcmCellularCoexB40BRange:(id)a3;
- (void)setWcmCellularCoexB41A1Range:(id)a3;
- (void)setWcmCellularCoexB41A2Range:(id)a3;
- (void)setWcmCellularCoexB7DLRange:(id)a3;
- (void)setWcmCellularCoexB7ULRange:(id)a3;
- (void)setWcmCellularLAACoexDeactStopTimer:(unint64_t)a3;
- (void)setWcmCellularLAACoexDeactTimer:(unint64_t)a3;
- (void)setWcmCellularLAACoexProtectCQIPeriod:(unint64_t)a3;
- (void)setWcmCellularLAACoexThresholdIn:(unint64_t)a3;
- (void)setWcmCellularLAACoexThresholdOut:(unint64_t)a3;
- (void)setWcmCellularScanProtectionCellFrequencies:(id)a3;
- (void)setWcmCellularScanProtectionCellFrequenciesforBT:(id)a3;
- (void)setWcmCellularScanProtectionWiFiChannels:(id)a3;
- (void)setWcmCellularScanProtectionWiFiChannelsWiFiEnh:(id)a3;
- (void)setWcmCellularScanProtectionWiFiMaxDuration:(id)a3;
- (void)setWcmCellularWCI2ModeAPTTable:(id)a3;
- (void)setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:(id)a3;
- (void)setWcmCellularWCI2ModeControllerLTERBThreshold:(id)a3;
- (void)setWcmCellularWCI2ModeControllerTxPowerLimit:(id)a3;
- (void)setWcmCellularWCI2ModeControllerTxPowerLimitTO:(id)a3;
- (void)setWcmCellularWCI2ModeFilterRBThresholdHigh:(id)a3;
- (void)setWcmCellularWCI2ModeFilterRBThresholdLow:(id)a3;
- (void)setWcmCellularWCI2ModeFrameDenialWindow:(id)a3;
- (void)setWcmCellularWCI2ModeLTEHarqnackratioThreshold:(id)a3;
- (void)setWcmCellularWCI2ModeLTEMaxTxPowerHigh:(id)a3;
- (void)setWcmCellularWCI2ModeLTEMaxTxPowerLow:(id)a3;
- (void)setWcmCellularWCI2ModeLTETxDenial:(id)a3;
- (void)setWcmCellularWCI2ModeLinkPathLossThreshold:(id)a3;
- (void)setWcmCellularWCI2ModeMaxAllowedFrameDenials:(id)a3;
- (void)setWcmCellularWCI2ModePolicy:(id)a3;
- (void)setWcmCellularWCI2ModePowerThreshold:(id)a3;
- (void)setWcmCellularWCI2ModeRBFilerAlpha:(id)a3;
- (void)setWcmCellularWCI2ModeRBThresholdAdvTx:(id)a3;
- (void)setWcmCellularWCI2ModeRBThresholdHigh:(id)a3;
- (void)setWcmCellularWCI2ModeRBThresholdLow:(id)a3;
- (void)setWcmCellularWCI2ModeTxPowerThresholdAdvTx:(id)a3;
- (void)setWcmCellularWCI2ModeWCI2PowerLimit:(id)a3;
- (void)setWcmCellularWCI2ModeWCI2PowerLimitTO:(id)a3;
- (void)setWcmCellularWCI2PlatformPolicyBitmap:(unint64_t)a3;
- (void)setWcmCoexFeatures:(id)a3;
- (void)setWcmGen9rFemDefaultMode2gWiFiCellularbands:(id)a3;
- (void)setWcmGen9rFemDefaultMode5gWiFiCellularbands:(id)a3;
- (void)setWcmHFBTChannelMapDefault:(id)a3;
- (void)setWcmHPCellularBTAFHMapFixed:(id)a3;
- (void)setWcmWCI2FrameSyncAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2FrameSyncAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSInactivityAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSInactivityAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSPatternAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSPatternAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSPriorityAssertOffsetRequest:(unint64_t)a3;
- (void)setWcmWCI2MWSRxAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSRxAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSRxDeAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSRxDeAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSScanFrequencyAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSScanFrequencyAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSTxAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSTxAssertOffset:(int64_t)a3;
- (void)setWcmWCI2MWSTxDeAssertJitter:(unint64_t)a3;
- (void)setWcmWCI2MWSTxDeAssertOffset:(int64_t)a3;
- (void)setWcmWiFiActiveDwellTime:(id)a3;
- (void)setWcmWiFiActiveScanThrottleMask:(id)a3;
- (void)setWcmWiFiAntennaCellPolicy:(id)a3;
- (void)setWcmWiFiAntennaCellPolicyDefault:(id)a3;
- (void)setWcmWiFiAntennaConfig:(id)a3;
- (void)setWcmWiFiAntennaConfigDefault:(id)a3;
- (void)setWcmWiFiB40ABlocklistChannels:(id)a3;
- (void)setWcmWiFiB40AWCI2EnabledChannels:(id)a3;
- (void)setWcmWiFiB40BBlocklistChannels:(id)a3;
- (void)setWcmWiFiB40BWCI2EnabledChannels:(id)a3;
- (void)setWcmWiFiB41A1BlocklistChannels:(id)a3;
- (void)setWcmWiFiB41A1WCI2EnabledChannels:(id)a3;
- (void)setWcmWiFiB41A2BlocklistChannels:(id)a3;
- (void)setWcmWiFiB41A2WCI2EnabledChannels:(id)a3;
- (void)setWcmWiFiB7BlocklistChannels:(id)a3;
- (void)setWcmWiFiB7WCI2EnabledChannels:(id)a3;
- (void)setWcmWiFiBTCoexProfileClamshell:(id)a3;
- (void)setWcmWiFiBTCoexProfileDefault5G:(id)a3;
- (void)setWcmWiFiBTCoexProfileDefault:(id)a3;
- (void)setWcmWiFiBTCoexProfileHPP:(id)a3;
- (void)setWcmWiFiBTCoexProfileHPPHeavy:(id)a3;
- (void)setWcmWiFiBTCoexProfileHeavy:(id)a3;
- (void)setWcmWiFiBTCoexProfileHeavyA2DP:(id)a3;
- (void)setWcmWiFiBTCoexProfileHeavyHFP:(id)a3;
- (void)setWcmWiFiBTCoexProfileHeavyLEA:(id)a3;
- (void)setWcmWiFiBTCoexProfileLight:(id)a3;
- (void)setWcmWiFiBTCoexProfileTDD:(id)a3;
- (void)setWcmWiFiBTCoexProfileThreadHybrid:(id)a3;
- (void)setWcmWiFiBTCoexProfileUSB3Desense:(id)a3;
- (void)setWcmWiFiCellCoexIssueTable:(id)a3;
- (void)setWcmWiFiEnvelopeIndicationTimer:(id)a3;
- (void)setWcmWiFiEnvelopeOnIndication:(id)a3;
- (void)setWcmWiFiPriThresholdHigh:(id)a3;
- (void)setWcmWiFiPriThresholdLow:(id)a3;
- (void)setWcmWiFiPriThresholdMed:(id)a3;
- (void)setWcmWiFiRxProtectAutoParamThresh:(id)a3;
- (void)setWcmWiFiRxProtectAutoParamWeight:(id)a3;
- (void)setWcmWiFiRxProtectMode:(id)a3;
- (void)setWcmWiFiScanJoinProtectDuration:(id)a3;
- (void)setWcmWiFiScanThrottlingChannelIndices:(id)a3;
- (void)setWcmWiFiSupportFrameConfig:(BOOL)a3;
- (void)setWcmWiFiSupportWciSignalingConfig:(BOOL)a3;
- (void)setWcmWiFiTxOnIndication:(id)a3;
- (void)setWcmWiFiWCI2TxDurationThresh:(id)a3;
- (void)setWrmPlatformId:(int)a3;
- (void)setWrmSku:(int)a3;
@end

@implementation WCM_PlatformManager

- (int)wrmPlatformId
{
  return self->_wrmPlatformId;
}

- (WCM_CellularRc1CoexIssueTable)wcmCellRc1CoexIssueTable
{
  return self->_wcmCellRc1CoexIssueTable;
}

- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerHigh
{
  return self->_wcmCellularWCI2ModeLTEMaxTxPowerHigh;
}

- (WCM_WiFiCellCoexIssueBandTable)wcmWiFiCellCoexIssueTable
{
  return self->_wcmWiFiCellCoexIssueTable;
}

- (BOOL)isBand7CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0) {
      return 0;
    }
    double v6 = a5 + a6 * -0.5;
    [(WCM_PlatformManager *)self wcmCellularCoexB7DLRange];
  }
  else
  {
    double v6 = a3 + a4 * -0.5;
    [(WCM_PlatformManager *)self wcmCellularCoexB7ULRange];
  }
  double v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7DLRange
{
  double begin = self->_wcmCellularCoexB7DLRange._begin;
  double length = self->_wcmCellularCoexB7DLRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (int64_t)wcmWCI2FrameSyncAssertOffset
{
  return self->_wcmWCI2FrameSyncAssertOffset;
}

- (unint64_t)wcmWCI2FrameSyncAssertJitter
{
  return self->_wcmWCI2FrameSyncAssertJitter;
}

- (NSData)wcmHPCellularBTAFHMapFixed
{
  return self->_wcmHPCellularBTAFHMapFixed;
}

- (NSDictionary)wcmGen9rFemDefaultMode5gWiFiCellularbands
{
  return self->_wcmGen9rFemDefaultMode5gWiFiCellularbands;
}

- (NSDictionary)wcmGen9rFemDefaultMode2gWiFiCellularbands
{
  return self->_wcmGen9rFemDefaultMode2gWiFiCellularbands;
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdLow
{
  return self->_wcmCellularWCI2ModeRBThresholdLow;
}

- (NSNumber)wcmCellularWCI2ModePolicy
{
  return self->_wcmCellularWCI2ModePolicy;
}

- (WCM_PlatformManager)init
{
  NSLog(@"Init Platform", a2);
  v6.receiver = self;
  v6.super_class = (Class)WCM_PlatformManager;
  v3 = [(WCM_PlatformManager *)&v6 init];
  v4 = v3;
  if (v3)
  {
    [(WCM_PlatformManager *)v3 setPlatform];
    [(WCM_PlatformManager *)v4 initPlatformPolicies];
  }
  return v4;
}

- (void)dealloc
{
  NSLog(@"Dealloc Platform", a2);

  v3.receiver = self;
  v3.super_class = (Class)WCM_PlatformManager;
  [(WCM_PlatformManager *)&v3 dealloc];
}

- (NSMutableSet)wcmCoexFeatures
{
  $F24F406B2B787EFB06265DBA3D28CBD5 result = self->_wcmCoexFeatures;
  if (!result)
  {
    $F24F406B2B787EFB06265DBA3D28CBD5 result = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_wcmCoexFeatures = result;
  }
  return result;
}

- (void)initPlatformPolicies
{
  +[WCM_Logging initSettingsFromPreferences];
  [(WCM_PlatformManager *)self setLoggingToFileEnabled:+[WCM_Logging getLogToFile]];
  +[WCM_Logging logLevel:1, @"WRM Version: %s", "" message];
  +[WCM_Logging logLevel:1, @"Init Platform Policies for wrmPlatformId(%u)", [(WCM_PlatformManager *)self wrmPlatformId] message];
  [(WCM_PlatformManager *)self setForceWiFiBTCoexToTDD:[(WCM_PlatformManager *)self fetchWRMdebugPlistForceTDD]];
  if ([(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
    +[WCM_Logging logLevel:2, @"Forcing WiFi/BT coex to TDD ? (%d)", [(WCM_PlatformManager *)self forceWiFiBTCoexToTDD] message];
  }
  [(WCM_PlatformManager *)self loadStaticPolicyFor:[(WCM_PlatformManager *)self wrmPlatformId]];
  [(WCM_PlatformManager *)self configureSupportedPlatform];
  value = 0;
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"ConfigInfo", @"com.apple.WirelessRadioManager.debug");
  if (v3
    && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v3))
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, @"ConfigEnable", (const void **)&value)
    && (CFTypeID v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
  {
    if (CFEqual(@"TRUE", (CFStringRef)value)) {
      [(WCM_PlatformManager *)self loadCoexConfigurablePolicy];
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"ConfigInfo not Found"];
  }
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"DisableiRAT"])[(WCM_PlatformManager *)self setIRATSupported:0]; {
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"LTEScanProtection"])[(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x400];
  }
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"AntennaSelectionCoex"])[(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x800]; {
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"CellularWatchFcmBcmAntennaReport"])[(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x800];
  }
  if (([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"AntennaSelectionV2Coex"] & 1) != 0|| [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"AntennaSelectionV1_1Coex"])
  {
    [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x800];
    [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x10000];
  }
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"WCI2Type7ShortBit"])[(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x4000]; {
  if (([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"ProtectWiFiRanging"] & 1) != 0|| [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"CellularMwsTxAllBands"])
  }
  {
    [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 2];
  }
  if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"LTELAACoexSupport"])
  {
    [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x20000];
    if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"RCU1Support"])
    {
      if ([(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] containsObject:@"Bb20PolicyConversion"])[(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x40000]; {
    }
      }
  }
  if (v3) {
    CFRelease(v3);
  }
  [(WCM_PlatformManager *)self printPlatformConfig];
}

- (void)printPlatformConfig
{
}

- (void)loadConfigurableActiveFeature:(id)a3
{
  [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] removeAllObjects];
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"DisableiRAT"), "BOOLValue")) {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableiRAT"];
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WCI2Mode"), "BOOLValue")) {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Mode"];
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"KeepBTAwake"), "BOOLValue")) {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"KeepBTAwake"];
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"LTEScanProtection"), "BOOLValue")) {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
  }
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"LTECDRXWiFiTimeSharing"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"LTECDRXWiFiTimeSharing")) {
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AntennaSelectionCoex"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"AntennaSelectionCoex");
  }
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AntennaSelectionV2Coex"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"AntennaSelectionV2Coex")) {
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AntennaSelectionV1_1Coex"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"AntennaSelectionV1_1Coex");
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiOCLSupport"), "BOOLValue")) {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
  }
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiAWDWCI2CoexBitmap"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"WiFiAWDWCI2CoexBitmap")) {
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WCI2Type7ShortBit"), "BOOLValue"))
  }
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AntennaTunningForGps"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"AntennaTunningForGps")) {
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"BTDiversityAFHMap"), "BOOLValue"))
  }
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTDiversityAFHMap"];
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiAWDWCI2CoexBitmap"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"WiFiAWDWCI2CoexBitmap")) {
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WCI2Type7ShortBit"), "BOOLValue"))
  }
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AntennaTunningForGps"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"AntennaTunningForGps")) {
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"ProtectWiFiRanging"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"ProtectWiFiRanging");
  }
  CFStringRef v5 = @"WiFiBtProfile";
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiBtProfile"), "BOOLValue") & 1) != 0
    || (CFStringRef v5 = @"WiFiBt5GProfile",
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiBt5GProfile"), "BOOLValue")))
  {
    [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:v5];
  }
  if ([objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"WiFiAntennaFallback"), "BOOLValue"])-[NSMutableSet addObject:](-[WCM_PlatformManager wcmCoexFeatures](self, "wcmCoexFeatures"), "addObject:", @"WiFiAntennaFallback")) {
  if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"Wifi5gChannelMapping"), "BOOLValue"))
  }
  {
    objc_super v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
    [(NSMutableSet *)v6 addObject:@"Wifi5gChannelMapping"];
  }
}

- (void)loadCoexConfigurablePolicy
{
  +[WCM_Logging logLevel:3, @"Loading Coex Configurable Policies", 0, 0 message];
  id v3 = +[NSPropertyListSerialization propertyListWithData:sub_100095D24(@"WRMPolicy", @"plist") options:2 format:&v10 error:&v11];
  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"CoexPolicy"];
    if (v4)
    {
      CFStringRef v5 = v4;
      id v6 = [v4 objectForKeyedSubscript:@"WiFi"];
      if (v6) {
        [(WCM_PlatformManager *)self loadWiFiConfigurablePolicy:v6];
      }
      id v7 = [v5 objectForKeyedSubscript:@"BT"];
      if (v7) {
        [(WCM_PlatformManager *)self loadBTConfigurablePolicy:v7];
      }
      id v8 = [v5 objectForKeyedSubscript:@"Cellular"];
      if (v8) {
        [(WCM_PlatformManager *)self loadCellularConfigurablePolicy:v8];
      }
      id v9 = [v5 objectForKeyedSubscript:@"activeFeatures"];
      if (v9) {
        [(WCM_PlatformManager *)self loadConfigurableActiveFeature:v9];
      }
    }
    else
    {
      NSLog(@"No Coex specific config");
    }
    [(WCM_PlatformManager *)self printPlatformConfig];
  }
  else
  {
    +[WCM_Logging logLevel:1 message:@"No Policy found"];
  }
}

- (void)loadWiFiConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmWiFiB7BlocklistChannels:](self, "setWcmWiFiB7BlocklistChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B7_BLOCKLIST_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB7WCI2EnabledChannels:](self, "setWcmWiFiB7WCI2EnabledChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B7_WCI2_ENABLED_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB40ABlocklistChannels:](self, "setWcmWiFiB40ABlocklistChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B40A_BLOCKLIST_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB40AWCI2EnabledChannels:](self, "setWcmWiFiB40AWCI2EnabledChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B40A_WCI2_ENABLED_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB40BBlocklistChannels:](self, "setWcmWiFiB40BBlocklistChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B40B_BLOCKLIST_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB40BWCI2EnabledChannels:](self, "setWcmWiFiB40BWCI2EnabledChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B40B_WCI2_ENABLED_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB41A1BlocklistChannels:](self, "setWcmWiFiB41A1BlocklistChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B41A1_BLOCKLIST_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB41A1WCI2EnabledChannels:](self, "setWcmWiFiB41A1WCI2EnabledChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B41A1_WCI2_ENABLED_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB41A2BlocklistChannels:](self, "setWcmWiFiB41A2BlocklistChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B41A2_BLOCKLIST_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiB41A2WCI2EnabledChannels:](self, "setWcmWiFiB41A2WCI2EnabledChannels:", [a3 objectForKeyedSubscript:@"WCM_WIFI_B41A2_WCI2_ENABLED_CHANNELS"]);
  -[WCM_PlatformManager setWcmWiFiPriThresholdLow:](self, "setWcmWiFiPriThresholdLow:", [a3 objectForKeyedSubscript:@"WCM_WIFI_RX_PRI_THRESHOLD_LOW"]);
  -[WCM_PlatformManager setWcmWiFiPriThresholdMed:](self, "setWcmWiFiPriThresholdMed:", [a3 objectForKeyedSubscript:@"WCM_WIFI_RX_PRI_THRESHOLD_MED"]);
  id v5 = [a3 objectForKeyedSubscript:@"WCM_WIFI_RX_PRI_THRESHOLD_HIGH"];

  [(WCM_PlatformManager *)self setWcmWiFiPriThresholdHigh:v5];
}

- (void)loadBTConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmBTAFHMapDefault:](self, "setWcmBTAFHMapDefault:", [a3 objectForKeyedSubscript:@"WCM_BT_AFHMAP_DEFAULT"]);
  -[WCM_PlatformManager setWcmBTB7AFHMap:](self, "setWcmBTB7AFHMap:", [a3 objectForKeyedSubscript:@"WCM_BT_B7_AFHMAP"]);
  -[WCM_PlatformManager setWcmBTB40AAFHMap:](self, "setWcmBTB40AAFHMap:", [a3 objectForKeyedSubscript:@"WCM_BT_B40A_AFHMAP"]);
  -[WCM_PlatformManager setWcmBTB40BAFHMap:](self, "setWcmBTB40BAFHMap:", [a3 objectForKeyedSubscript:@"WCM_BT_B40B_AFHMAP"]);
  -[WCM_PlatformManager setWcmBTB41A1AFHMap:](self, "setWcmBTB41A1AFHMap:", [a3 objectForKeyedSubscript:@"WCM_BT_B41A1_AFHMAP"]);
  -[WCM_PlatformManager setWcmBTB41A2AFHMap:](self, "setWcmBTB41A2AFHMap:", [a3 objectForKeyedSubscript:@"WCM_BT_B41A2_AFHMAP"]);
  id v5 = [a3 objectForKeyedSubscript:@"WCM_BT_PREFERRED_ROLE"];

  [(WCM_PlatformManager *)self setWcmBTPreferredRole:v5];
}

- (void)loadCellularConfigurablePolicy:(id)a3
{
  -[WCM_PlatformManager setWcmCellularWCI2ModePolicy:](self, "setWcmCellularWCI2ModePolicy:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_POLICY"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModePowerThreshold:](self, "setWcmCellularWCI2ModePowerThreshold:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_POWERTHRESHOLD"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdHigh:](self, "setWcmCellularWCI2ModeRBThresholdHigh:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_HIGH"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdLow:](self, "setWcmCellularWCI2ModeRBThresholdLow:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_LOW"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTETxDenial:](self, "setWcmCellularWCI2ModeLTETxDenial:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_LTE_TXDENIAL"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeAPTTable:](self, "setWcmCellularWCI2ModeAPTTable:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_APTTABLE"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimit:](self, "setWcmCellularWCI2ModeControllerTxPowerLimit:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_CONTROLLER_TXPOWERLIMIT"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimit:](self, "setWcmCellularWCI2ModeWCI2PowerLimit:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_WCI2_POWERLIMIT"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeLinkPathLossThreshold:](self, "setWcmCellularWCI2ModeLinkPathLossThreshold:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_LINK_PATHLOSSTHRESHOLD"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBFilerAlpha:](self, "setWcmCellularWCI2ModeRBFilerAlpha:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_RB_FILTERALPHA"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdHigh:](self, "setWcmCellularWCI2ModeFilterRBThresholdHigh:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_FILTER_RBTHRESHOLD_HIGH"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeFilterRBThresholdLow:](self, "setWcmCellularWCI2ModeFilterRBThresholdLow:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_FILTER_RBTHRESHOLD_LOW"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeControllerTxPowerLimitTO:](self, "setWcmCellularWCI2ModeControllerTxPowerLimitTO:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_CONTROLLER_TXPOWERLIMIT_TO"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeWCI2PowerLimitTO:](self, "setWcmCellularWCI2ModeWCI2PowerLimitTO:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_WCI2_POWERLIMIT_TO"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeMaxAllowedFrameDenials:](self, "setWcmCellularWCI2ModeMaxAllowedFrameDenials:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_MAX_ALLOWED_FRAME_DENIALS"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeFrameDenialWindow:](self, "setWcmCellularWCI2ModeFrameDenialWindow:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_FRAME_DENIAL_WINDOW"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeTxPowerThresholdAdvTx:](self, "setWcmCellularWCI2ModeTxPowerThresholdAdvTx:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_TXPOWER_THRESHOLD_ADVANCE_TX"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeRBThresholdAdvTx:](self, "setWcmCellularWCI2ModeRBThresholdAdvTx:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_WCI2MODE_RB_THRESHOLD_ADVANCE_TX"]);
  -[WCM_PlatformManager setWcmCellularWCI2ModeLTEMaxTxPowerHigh:](self, "setWcmCellularWCI2ModeLTEMaxTxPowerHigh:", [a3 objectForKeyedSubscript:@"WCM_CELLULAR_LTE_MAX_TX_POWER_HIGH"]);
  id v5 = [a3 objectForKeyedSubscript:@"WCM_CELLULAR_LTE_MAX_TX_POWER_LOW"];

  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLTEMaxTxPowerLow:v5];
}

- (void)enableLegacyCoexFeature
{
  v2 = [(WCM_PlatformManager *)self wcmCoexFeatures];

  [(NSMutableSet *)v2 addObject:@"KeepBTAwake"];
}

- (void)configureSupportedPlatform
{
  unsigned int v3 = [(WCM_PlatformManager *)self wrmPlatformId];
  uint64_t v4 = 1;
  switch(v3)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 5u:
    case 7u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xAFu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xDCu:
    case 0xDDu:
    case 0xDEu:
    case 0xDFu:
    case 0xE0u:
    case 0xE1u:
    case 0xE2u:
    case 0xE3u:
    case 0xE4u:
    case 0xE5u:
    case 0xE6u:
    case 0xE7u:
    case 0xE8u:
    case 0xE9u:
    case 0xEAu:
    case 0xEBu:
    case 0xECu:
    case 0xEDu:
    case 0xEEu:
    case 0xEFu:
    case 0xF0u:
    case 0xF1u:
    case 0xF2u:
    case 0xF3u:
    case 0xF4u:
    case 0x104u:
    case 0x105u:
    case 0x106u:
    case 0x107u:
    case 0x108u:
    case 0x109u:
    case 0x10Au:
    case 0x12Cu:
    case 0x12Du:
    case 0x12Eu:
    case 0x12Fu:
    case 0x130u:
    case 0x131u:
    case 0x132u:
    case 0x133u:
    case 0x134u:
    case 0x135u:
    case 0x136u:
    case 0x137u:
    case 0x138u:
    case 0x139u:
    case 0x13Au:
    case 0x13Bu:
    case 0x13Cu:
    case 0x13Du:
    case 0x13Eu:
    case 0x13Fu:
    case 0x140u:
    case 0x141u:
    case 0x142u:
    case 0x143u:
    case 0x144u:
    case 0x145u:
    case 0x146u:
    case 0x147u:
    case 0x148u:
    case 0x149u:
    case 0x14Au:
    case 0x14Bu:
    case 0x14Cu:
    case 0x14Du:
    case 0x14Eu:
    case 0x14Fu:
    case 0x150u:
    case 0x151u:
    case 0x152u:
    case 0x153u:
    case 0x154u:
    case 0x155u:
    case 0x156u:
    case 0x157u:
    case 0x158u:
    case 0x159u:
    case 0x15Au:
    case 0x15Bu:
    case 0x15Cu:
    case 0x15Du:
      break;
    case 4u:
    case 6u:
    case 8u:
    case 9u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0xADu:
    case 0xAEu:
    case 0xB6u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
    case 0xC4u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCBu:
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD2u:
    case 0xD3u:
    case 0xD4u:
    case 0xD5u:
    case 0xD6u:
    case 0xD7u:
    case 0xD8u:
    case 0xD9u:
    case 0xDAu:
    case 0xDBu:
    case 0xF5u:
    case 0xF6u:
    case 0xF7u:
    case 0xF8u:
    case 0xF9u:
    case 0xFAu:
    case 0xFBu:
    case 0xFCu:
    case 0xFDu:
    case 0xFEu:
    case 0xFFu:
    case 0x100u:
    case 0x101u:
    case 0x102u:
    case 0x103u:
    case 0x10Bu:
    case 0x10Cu:
    case 0x10Du:
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
    case 0x111u:
    case 0x112u:
    case 0x113u:
    case 0x114u:
    case 0x115u:
    case 0x116u:
    case 0x117u:
    case 0x118u:
    case 0x119u:
    case 0x11Au:
    case 0x11Bu:
    case 0x11Cu:
    case 0x11Du:
    case 0x11Eu:
    case 0x11Fu:
    case 0x120u:
    case 0x121u:
    case 0x122u:
    case 0x123u:
    case 0x124u:
    case 0x125u:
    case 0x126u:
    case 0x127u:
    case 0x128u:
    case 0x129u:
    case 0x12Au:
    case 0x12Bu:
      goto LABEL_7;
    default:
      if (v3 - 500 >= 3 && v3 - 600 >= 2) {
LABEL_7:
      }
        uint64_t v4 = 0;
      break;
  }
  [(WCM_PlatformManager *)self setCoexSupported:v4];

  [(WCM_PlatformManager *)self setIRATSupported:1];
}

- (BOOL)isBand40ACoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0) {
      return 0;
    }
    double v6 = a6 * 0.5 + a5;
  }
  else
  {
    double v6 = a4 * 0.5 + a3;
  }
  [(WCM_PlatformManager *)self wcmCellularCoexB40ARange];
  double v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand40BCoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0) {
      return 0;
    }
    double v6 = a6 * 0.5 + a5;
  }
  else
  {
    double v6 = a4 * 0.5 + a3;
  }
  [(WCM_PlatformManager *)self wcmCellularCoexB40BRange];
  double v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand41A1CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0) {
      return 0;
    }
    double v6 = a5 + a6 * -0.5;
  }
  else
  {
    double v6 = a3 + a4 * -0.5;
  }
  [(WCM_PlatformManager *)self wcmCellularCoexB41A1Range];
  double v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (BOOL)isBand41A2CoexActiveForULFreq:(double)a3 ulBW:(double)a4 dlFreq:(double)a5 dlBW:(double)a6
{
  if (a3 == 0.0 || a4 == 0.0)
  {
    if (a5 == 0.0 || a6 == 0.0) {
      return 0;
    }
    double v6 = a5 + a6 * -0.5;
  }
  else
  {
    double v6 = a3 + a4 * -0.5;
  }
  [(WCM_PlatformManager *)self wcmCellularCoexB41A2Range];
  double v9 = v7 + v8;
  return v7 <= v6 && v9 >= v6;
}

- (unint64_t)getBand40AUlCenterFreq
{
  [(WCM_PlatformManager *)self wcmCellularCoexB40ARange];
  double v4 = v3;
  [(WCM_PlatformManager *)self wcmCellularCoexB40ARange];
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand40AUlBw
{
  [(WCM_PlatformManager *)self wcmCellularCoexB40ARange];
  return (unint64_t)v2;
}

- (unint64_t)getBand40BUlCenterFreq
{
  [(WCM_PlatformManager *)self wcmCellularCoexB40BRange];
  double v4 = v3;
  [(WCM_PlatformManager *)self wcmCellularCoexB40BRange];
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand40BUlBw
{
  [(WCM_PlatformManager *)self wcmCellularCoexB40BRange];
  return (unint64_t)v2;
}

- (unint64_t)getBand41A1UlCenterFreq
{
  [(WCM_PlatformManager *)self wcmCellularCoexB41A1Range];
  double v4 = v3;
  [(WCM_PlatformManager *)self wcmCellularCoexB41A1Range];
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand41A1UlBw
{
  [(WCM_PlatformManager *)self wcmCellularCoexB41A1Range];
  return (unint64_t)v2;
}

- (unint64_t)getBand41A2UlCenterFreq
{
  [(WCM_PlatformManager *)self wcmCellularCoexB41A2Range];
  double v4 = v3;
  [(WCM_PlatformManager *)self wcmCellularCoexB41A2Range];
  return (unint64_t)(v4 + v5 * 0.5);
}

- (unint64_t)getBand41A2UlBw
{
  [(WCM_PlatformManager *)self wcmCellularCoexB41A2Range];
  return (unint64_t)v2;
}

- (BOOL)isIMD2ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8
{
  return sub_10008B3EC(0, a3 - a4 * 0.5, a4, a5 - a5 * 0.5, a6, a7 - a8 * 0.5, a8);
}

- (BOOL)isIMD3ForFirstFreq:(double)a3 firstBW:(double)a4 secondFreq:(double)a5 secondBW:(double)a6 resultantFreq:(double)a7 resultantBW:(double)a8
{
  return sub_10008B494(0, a3 - a4 * 0.5, a4, a5 - a5 * 0.5, a6, a7 - a8 * 0.5, a8);
}

- (BOOL)is3FoForFreq:(double)a3 bw:(double)a4 resultantFreq:(double)a5 resultantBW:(double)a6
{
  return sub_10008B314(0, a3 - a4 * 0.5, a4, a5 - a6 * 0.5, a6);
}

- (BOOL)fetchWRMdebugPlistForceTDD
{
  CFDictionaryRef v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"ForceTDD", @"com.apple.WirelessRadioManager.debug");
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v3, @"ForceWiFiBTCoexModeToTDD", (const void **)&value))
      {
        CFComparisonResult v5 = CFStringCompare(@"TRUE", (CFStringRef)value, 0);
        double v6 = "FALSE";
        BOOL v7 = v5 == kCFCompareEqualTo;
        if (v5 == kCFCompareEqualTo) {
          double v6 = "TRUE";
        }
        +[WCM_Logging logLevel:3, @"In fetchWRMdebugPlistForceTDD: Reading value %s", v6 message];
        goto LABEL_11;
      }
      CFStringRef v8 = @"In fetchWRMdebugPlistForceTDD: Reading value FAILED";
    }
    else
    {
      CFStringRef v8 = @"In fetchWRMdebugPlistForceTDD: dict does not exist";
    }
    +[WCM_Logging logLevel:3 message:v8];
    BOOL v7 = 0;
LABEL_11:
    CFRelease(v3);
    return v7;
  }
  +[WCM_Logging logLevel:3 message:@"In fetchWRMdebugPlistForceTDD: dict does not exist"];
  return 0;
}

- (void)setWrmPlatformId:(int)a3
{
  self->_wrmPlatformId = a3;
}

- (int)wrmSku
{
  return self->_wrmSku;
}

- (void)setWrmSku:(int)a3
{
  self->_wrmSku = a3;
}

- (BOOL)coexSupported
{
  return self->_coexSupported;
}

- (void)setCoexSupported:(BOOL)a3
{
  self->_coexSupported = a3;
}

- (BOOL)iRATSupported
{
  return self->_iRATSupported;
}

- (void)setIRATSupported:(BOOL)a3
{
  self->_iRATSupported = a3;
}

- (BOOL)loggingToFileEnabled
{
  return self->_loggingToFileEnabled;
}

- (void)setLoggingToFileEnabled:(BOOL)a3
{
  self->_loggingToFileEnabled = a3;
}

- (void)setWcmCoexFeatures:(id)a3
{
  self->_wcmCoexFeatures = (NSMutableSet *)a3;
}

- (void)setWcmWiFiCellCoexIssueTable:(id)a3
{
  self->_wcmWiFiCellCoexIssueTable = (WCM_WiFiCellCoexIssueBandTable *)a3;
}

- (void)setWcmCellRc1CoexIssueTable:(id)a3
{
  self->_wcmCellRc1CoexIssueTable = (WCM_CellularRc1CoexIssueTable *)a3;
}

- (NSDictionary)wcmWiFiBTCoexProfileDefault
{
  return self->_wcmWiFiBTCoexProfileDefault;
}

- (void)setWcmWiFiBTCoexProfileDefault:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileDefault5G
{
  return self->_wcmWiFiBTCoexProfileDefault5G;
}

- (void)setWcmWiFiBTCoexProfileDefault5G:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileLight
{
  return self->_wcmWiFiBTCoexProfileLight;
}

- (void)setWcmWiFiBTCoexProfileLight:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavy
{
  return self->_wcmWiFiBTCoexProfileHeavy;
}

- (void)setWcmWiFiBTCoexProfileHeavy:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileClamshell
{
  return self->_wcmWiFiBTCoexProfileClamshell;
}

- (void)setWcmWiFiBTCoexProfileClamshell:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHPP
{
  return self->_wcmWiFiBTCoexProfileHPP;
}

- (void)setWcmWiFiBTCoexProfileHPP:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHPPHeavy
{
  return self->_wcmWiFiBTCoexProfileHPPHeavy;
}

- (void)setWcmWiFiBTCoexProfileHPPHeavy:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileUSB3Desense
{
  return self->_wcmWiFiBTCoexProfileUSB3Desense;
}

- (void)setWcmWiFiBTCoexProfileUSB3Desense:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyHFP
{
  return self->_wcmWiFiBTCoexProfileHeavyHFP;
}

- (void)setWcmWiFiBTCoexProfileHeavyHFP:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyLEA
{
  return self->_wcmWiFiBTCoexProfileHeavyLEA;
}

- (void)setWcmWiFiBTCoexProfileHeavyLEA:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileHeavyA2DP
{
  return self->_wcmWiFiBTCoexProfileHeavyA2DP;
}

- (void)setWcmWiFiBTCoexProfileHeavyA2DP:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileTDD
{
  return self->_wcmWiFiBTCoexProfileTDD;
}

- (void)setWcmWiFiBTCoexProfileTDD:(id)a3
{
}

- (NSDictionary)wcmWiFiBTCoexProfileThreadHybrid
{
  return self->_wcmWiFiBTCoexProfileThreadHybrid;
}

- (void)setWcmWiFiBTCoexProfileThreadHybrid:(id)a3
{
}

- (BOOL)forceWiFiBTCoexToTDD
{
  return self->_forceWiFiBTCoexToTDD;
}

- (void)setForceWiFiBTCoexToTDD:(BOOL)a3
{
  self->_forceWiFiBTCoexToTDD = a3;
}

- (void)setWcmWCI2FrameSyncAssertOffset:(int64_t)a3
{
  self->_wcmWCI2FrameSyncAssertOffset = a3;
}

- (void)setWcmWCI2FrameSyncAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2FrameSyncAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSRxAssertOffset
{
  return self->_wcmWCI2MWSRxAssertOffset;
}

- (void)setWcmWCI2MWSRxAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSRxAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSRxAssertJitter
{
  return self->_wcmWCI2MWSRxAssertJitter;
}

- (void)setWcmWCI2MWSRxAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSRxAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSRxDeAssertOffset
{
  return self->_wcmWCI2MWSRxDeAssertOffset;
}

- (void)setWcmWCI2MWSRxDeAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSRxDeAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSRxDeAssertJitter
{
  return self->_wcmWCI2MWSRxDeAssertJitter;
}

- (void)setWcmWCI2MWSRxDeAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSRxDeAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSTxAssertOffset
{
  return self->_wcmWCI2MWSTxAssertOffset;
}

- (void)setWcmWCI2MWSTxAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSTxAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSTxAssertJitter
{
  return self->_wcmWCI2MWSTxAssertJitter;
}

- (void)setWcmWCI2MWSTxAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSTxAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSTxDeAssertOffset
{
  return self->_wcmWCI2MWSTxDeAssertOffset;
}

- (void)setWcmWCI2MWSTxDeAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSTxDeAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSTxDeAssertJitter
{
  return self->_wcmWCI2MWSTxDeAssertJitter;
}

- (void)setWcmWCI2MWSTxDeAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSTxDeAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSPatternAssertOffset
{
  return self->_wcmWCI2MWSPatternAssertOffset;
}

- (void)setWcmWCI2MWSPatternAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSPatternAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSPatternAssertJitter
{
  return self->_wcmWCI2MWSPatternAssertJitter;
}

- (void)setWcmWCI2MWSPatternAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSPatternAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSInactivityAssertOffset
{
  return self->_wcmWCI2MWSInactivityAssertOffset;
}

- (void)setWcmWCI2MWSInactivityAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSInactivityAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSInactivityAssertJitter
{
  return self->_wcmWCI2MWSInactivityAssertJitter;
}

- (void)setWcmWCI2MWSInactivityAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSInactivityAssertJitter = a3;
}

- (int64_t)wcmWCI2MWSScanFrequencyAssertOffset
{
  return self->_wcmWCI2MWSScanFrequencyAssertOffset;
}

- (void)setWcmWCI2MWSScanFrequencyAssertOffset:(int64_t)a3
{
  self->_wcmWCI2MWSScanFrequencyAssertOffset = a3;
}

- (unint64_t)wcmWCI2MWSScanFrequencyAssertJitter
{
  return self->_wcmWCI2MWSScanFrequencyAssertJitter;
}

- (void)setWcmWCI2MWSScanFrequencyAssertJitter:(unint64_t)a3
{
  self->_wcmWCI2MWSScanFrequencyAssertJitter = a3;
}

- (unint64_t)wcmWCI2MWSPriorityAssertOffsetRequest
{
  return self->_wcmWCI2MWSPriorityAssertOffsetRequest;
}

- (void)setWcmWCI2MWSPriorityAssertOffsetRequest:(unint64_t)a3
{
  self->_wcmWCI2MWSPriorityAssertOffsetRequest = a3;
}

- (BOOL)wcmWiFiSupportFrameConfig
{
  return self->_wcmWiFiSupportFrameConfig;
}

- (void)setWcmWiFiSupportFrameConfig:(BOOL)a3
{
  self->_wcmWiFiSupportFrameConfig = a3;
}

- (BOOL)wcmWiFiSupportWciSignalingConfig
{
  return self->_wcmWiFiSupportWciSignalingConfig;
}

- (void)setWcmWiFiSupportWciSignalingConfig:(BOOL)a3
{
  self->_wcmWiFiSupportWciSignalingConfig = a3;
}

- (NSArray)wcmWiFiB7BlocklistChannels
{
  return self->_wcmWiFiB7BlocklistChannels;
}

- (void)setWcmWiFiB7BlocklistChannels:(id)a3
{
}

- (NSArray)wcmWiFiB7WCI2EnabledChannels
{
  return self->_wcmWiFiB7WCI2EnabledChannels;
}

- (void)setWcmWiFiB7WCI2EnabledChannels:(id)a3
{
}

- (NSArray)wcmWiFiB40ABlocklistChannels
{
  return self->_wcmWiFiB40ABlocklistChannels;
}

- (void)setWcmWiFiB40ABlocklistChannels:(id)a3
{
}

- (NSArray)wcmWiFiB40AWCI2EnabledChannels
{
  return self->_wcmWiFiB40AWCI2EnabledChannels;
}

- (void)setWcmWiFiB40AWCI2EnabledChannels:(id)a3
{
}

- (NSArray)wcmWiFiB40BBlocklistChannels
{
  return self->_wcmWiFiB40BBlocklistChannels;
}

- (void)setWcmWiFiB40BBlocklistChannels:(id)a3
{
}

- (NSArray)wcmWiFiB40BWCI2EnabledChannels
{
  return self->_wcmWiFiB40BWCI2EnabledChannels;
}

- (void)setWcmWiFiB40BWCI2EnabledChannels:(id)a3
{
}

- (NSArray)wcmWiFiB41A1BlocklistChannels
{
  return self->_wcmWiFiB41A1BlocklistChannels;
}

- (void)setWcmWiFiB41A1BlocklistChannels:(id)a3
{
}

- (NSArray)wcmWiFiB41A1WCI2EnabledChannels
{
  return self->_wcmWiFiB41A1WCI2EnabledChannels;
}

- (void)setWcmWiFiB41A1WCI2EnabledChannels:(id)a3
{
}

- (NSArray)wcmWiFiB41A2BlocklistChannels
{
  return self->_wcmWiFiB41A2BlocklistChannels;
}

- (void)setWcmWiFiB41A2BlocklistChannels:(id)a3
{
}

- (NSArray)wcmWiFiB41A2WCI2EnabledChannels
{
  return self->_wcmWiFiB41A2WCI2EnabledChannels;
}

- (void)setWcmWiFiB41A2WCI2EnabledChannels:(id)a3
{
}

- (NSNumber)wcmWiFiPriThresholdLow
{
  return self->_wcmWiFiPriThresholdLow;
}

- (void)setWcmWiFiPriThresholdLow:(id)a3
{
}

- (NSNumber)wcmWiFiPriThresholdMed
{
  return self->_wcmWiFiPriThresholdMed;
}

- (void)setWcmWiFiPriThresholdMed:(id)a3
{
}

- (NSNumber)wcmWiFiPriThresholdHigh
{
  return self->_wcmWiFiPriThresholdHigh;
}

- (void)setWcmWiFiPriThresholdHigh:(id)a3
{
}

- (NSArray)wcmWiFiAntennaConfig
{
  return self->_wcmWiFiAntennaConfig;
}

- (void)setWcmWiFiAntennaConfig:(id)a3
{
}

- (NSNumber)wcmWiFiAntennaCellPolicy
{
  return self->_wcmWiFiAntennaCellPolicy;
}

- (void)setWcmWiFiAntennaCellPolicy:(id)a3
{
}

- (NSArray)wcmWiFiAntennaConfigDefault
{
  return self->_wcmWiFiAntennaConfigDefault;
}

- (void)setWcmWiFiAntennaConfigDefault:(id)a3
{
}

- (NSNumber)wcmWiFiAntennaCellPolicyDefault
{
  return self->_wcmWiFiAntennaCellPolicyDefault;
}

- (void)setWcmWiFiAntennaCellPolicyDefault:(id)a3
{
}

- (NSNumber)wcmWiFiRxProtectMode
{
  return self->_wcmWiFiRxProtectMode;
}

- (void)setWcmWiFiRxProtectMode:(id)a3
{
}

- (NSNumber)wcmWiFiRxProtectAutoParamWeight
{
  return self->_wcmWiFiRxProtectAutoParamWeight;
}

- (void)setWcmWiFiRxProtectAutoParamWeight:(id)a3
{
}

- (NSNumber)wcmWiFiRxProtectAutoParamThresh
{
  return self->_wcmWiFiRxProtectAutoParamThresh;
}

- (void)setWcmWiFiRxProtectAutoParamThresh:(id)a3
{
}

- (NSNumber)wcmWiFiTxOnIndication
{
  return self->_wcmWiFiTxOnIndication;
}

- (void)setWcmWiFiTxOnIndication:(id)a3
{
}

- (NSNumber)wcmWiFiScanJoinProtectDuration
{
  return self->_wcmWiFiScanJoinProtectDuration;
}

- (void)setWcmWiFiScanJoinProtectDuration:(id)a3
{
}

- (NSNumber)wcmWiFiEnvelopeOnIndication
{
  return self->_wcmWiFiEnvelopeOnIndication;
}

- (void)setWcmWiFiEnvelopeOnIndication:(id)a3
{
}

- (NSNumber)wcmWiFiEnvelopeIndicationTimer
{
  return self->_wcmWiFiEnvelopeIndicationTimer;
}

- (void)setWcmWiFiEnvelopeIndicationTimer:(id)a3
{
}

- (NSNumber)wcmWiFiWCI2TxDurationThresh
{
  return self->_wcmWiFiWCI2TxDurationThresh;
}

- (void)setWcmWiFiWCI2TxDurationThresh:(id)a3
{
}

- (NSNumber)wcmWiFiActiveScanThrottleMask
{
  return self->_wcmWiFiActiveScanThrottleMask;
}

- (void)setWcmWiFiActiveScanThrottleMask:(id)a3
{
}

- (NSNumber)wcmWiFiActiveDwellTime
{
  return self->_wcmWiFiActiveDwellTime;
}

- (void)setWcmWiFiActiveDwellTime:(id)a3
{
}

- (BOOL)wcmBTSupportTDDFrameConfig
{
  return self->_wcmBTSupportTDDFrameConfig;
}

- (void)setWcmBTSupportTDDFrameConfig:(BOOL)a3
{
  self->_wcmBTSupportTDDFrameConfig = a3;
}

- (NSData)wcmBTAFHMapDefault
{
  return self->_wcmBTAFHMapDefault;
}

- (void)setWcmBTAFHMapDefault:(id)a3
{
}

- (NSData)wcmBTB7AFHMap
{
  return self->_wcmBTB7AFHMap;
}

- (void)setWcmBTB7AFHMap:(id)a3
{
}

- (NSData)wcmBTB40AAFHMap
{
  return self->_wcmBTB40AAFHMap;
}

- (void)setWcmBTB40AAFHMap:(id)a3
{
}

- (NSData)wcmBTB40BAFHMap
{
  return self->_wcmBTB40BAFHMap;
}

- (void)setWcmBTB40BAFHMap:(id)a3
{
}

- (NSData)wcmBTB41A1AFHMap
{
  return self->_wcmBTB41A1AFHMap;
}

- (void)setWcmBTB41A1AFHMap:(id)a3
{
}

- (NSData)wcmBTB41A2AFHMap
{
  return self->_wcmBTB41A2AFHMap;
}

- (void)setWcmBTB41A2AFHMap:(id)a3
{
}

- (NSNumber)wcmBTPreferredRole
{
  return self->_wcmBTPreferredRole;
}

- (void)setWcmBTPreferredRole:(id)a3
{
}

- (NSNumber)wcmBTMaxNumberOfChannelsToAvoidForCellOOB
{
  return self->_wcmBTMaxNumberOfChannelsToAvoidForCellOOB;
}

- (void)setWcmBTMaxNumberOfChannelsToAvoidForCellOOB:(id)a3
{
}

- (void)setWcmHPCellularBTAFHMapFixed:(id)a3
{
}

- (NSData)wcmHFBTChannelMapDefault
{
  return self->_wcmHFBTChannelMapDefault;
}

- (void)setWcmHFBTChannelMapDefault:(id)a3
{
}

- (NSDictionary)wcmBTAntBlockEnableBandsDefault
{
  return self->_wcmBTAntBlockEnableBandsDefault;
}

- (void)setWcmBTAntBlockEnableBandsDefault:(id)a3
{
}

- (unint64_t)wcmBTWCI2ModeSendMsgBitmap
{
  return self->_wcmBTWCI2ModeSendMsgBitmap;
}

- (void)setWcmBTWCI2ModeSendMsgBitmap:(unint64_t)a3
{
  self->_wcmBTWCI2ModeSendMsgBitmap = a3;
}

- (unint64_t)wcmBTWCI2ModeRecvMsgBitmap
{
  return self->_wcmBTWCI2ModeRecvMsgBitmap;
}

- (void)setWcmBTWCI2ModeRecvMsgBitmap:(unint64_t)a3
{
  self->_wcmBTWCI2ModeRecvMsgBitmap = a3;
}

- (NSNumber)wcmBTDefaultAntennaNonCoex
{
  return self->_wcmBTDefaultAntennaNonCoex;
}

- (void)setWcmBTDefaultAntennaNonCoex:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfigNonCoex
{
  return self->_wcmBTAntennaConfigNonCoex;
}

- (void)setWcmBTAntennaConfigNonCoex:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfigParam1NonCoex
{
  return self->_wcmBTAntennaConfigParam1NonCoex;
}

- (void)setWcmBTAntennaConfigParam1NonCoex:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfigParam2NonCoex
{
  return self->_wcmBTAntennaConfigParam2NonCoex;
}

- (void)setWcmBTAntennaConfigParam2NonCoex:(id)a3
{
}

- (NSNumber)wcmBTDefaultAntenna
{
  return self->_wcmBTDefaultAntenna;
}

- (void)setWcmBTDefaultAntenna:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfig
{
  return self->_wcmBTAntennaConfig;
}

- (void)setWcmBTAntennaConfig:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfigParam1
{
  return self->_wcmBTAntennaConfigParam1;
}

- (void)setWcmBTAntennaConfigParam1:(id)a3
{
}

- (NSNumber)wcmBTAntennaConfigParam2
{
  return self->_wcmBTAntennaConfigParam2;
}

- (void)setWcmBTAntennaConfigParam2:(id)a3
{
}

- (NSNumber)wcmBTAntBlockDuration
{
  return self->_wcmBTAntBlockDuration;
}

- (void)setWcmBTAntBlockDuration:(id)a3
{
}

- (void)setWcmCellularWCI2ModePolicy:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModePowerThreshold
{
  return self->_wcmCellularWCI2ModePowerThreshold;
}

- (void)setWcmCellularWCI2ModePowerThreshold:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdHigh
{
  return self->_wcmCellularWCI2ModeRBThresholdHigh;
}

- (void)setWcmCellularWCI2ModeRBThresholdHigh:(id)a3
{
}

- (void)setWcmCellularWCI2ModeRBThresholdLow:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeLTETxDenial
{
  return self->_wcmCellularWCI2ModeLTETxDenial;
}

- (void)setWcmCellularWCI2ModeLTETxDenial:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeAPTTable
{
  return self->_wcmCellularWCI2ModeAPTTable;
}

- (void)setWcmCellularWCI2ModeAPTTable:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimit
{
  return self->_wcmCellularWCI2ModeControllerTxPowerLimit;
}

- (void)setWcmCellularWCI2ModeControllerTxPowerLimit:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimit
{
  return self->_wcmCellularWCI2ModeWCI2PowerLimit;
}

- (void)setWcmCellularWCI2ModeWCI2PowerLimit:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeLinkPathLossThreshold
{
  return self->_wcmCellularWCI2ModeLinkPathLossThreshold;
}

- (void)setWcmCellularWCI2ModeLinkPathLossThreshold:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeRBFilerAlpha
{
  return self->_wcmCellularWCI2ModeRBFilerAlpha;
}

- (void)setWcmCellularWCI2ModeRBFilerAlpha:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdHigh
{
  return self->_wcmCellularWCI2ModeFilterRBThresholdHigh;
}

- (void)setWcmCellularWCI2ModeFilterRBThresholdHigh:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeFilterRBThresholdLow
{
  return self->_wcmCellularWCI2ModeFilterRBThresholdLow;
}

- (void)setWcmCellularWCI2ModeFilterRBThresholdLow:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeControllerTxPowerLimitTO
{
  return self->_wcmCellularWCI2ModeControllerTxPowerLimitTO;
}

- (void)setWcmCellularWCI2ModeControllerTxPowerLimitTO:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeWCI2PowerLimitTO
{
  return self->_wcmCellularWCI2ModeWCI2PowerLimitTO;
}

- (void)setWcmCellularWCI2ModeWCI2PowerLimitTO:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeMaxAllowedFrameDenials
{
  return self->_wcmCellularWCI2ModeMaxAllowedFrameDenials;
}

- (void)setWcmCellularWCI2ModeMaxAllowedFrameDenials:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeFrameDenialWindow
{
  return self->_wcmCellularWCI2ModeFrameDenialWindow;
}

- (void)setWcmCellularWCI2ModeFrameDenialWindow:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeTxPowerThresholdAdvTx
{
  return self->_wcmCellularWCI2ModeTxPowerThresholdAdvTx;
}

- (void)setWcmCellularWCI2ModeTxPowerThresholdAdvTx:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeRBThresholdAdvTx
{
  return self->_wcmCellularWCI2ModeRBThresholdAdvTx;
}

- (void)setWcmCellularWCI2ModeRBThresholdAdvTx:(id)a3
{
}

- (void)setWcmCellularWCI2ModeLTEMaxTxPowerHigh:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeLTEMaxTxPowerLow
{
  return self->_wcmCellularWCI2ModeLTEMaxTxPowerLow;
}

- (void)setWcmCellularWCI2ModeLTEMaxTxPowerLow:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeControllerLTERBThreshold
{
  return self->_wcmCellularWCI2ModeControllerLTERBThreshold;
}

- (void)setWcmCellularWCI2ModeControllerLTERBThreshold:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeLTEHarqnackratioThreshold
{
  return self->_wcmCellularWCI2ModeLTEHarqnackratioThreshold;
}

- (void)setWcmCellularWCI2ModeLTEHarqnackratioThreshold:(id)a3
{
}

- (NSNumber)wcmCellularWCI2ModeControllerLTEPowerLimitingEnable
{
  return self->_wcmCellularWCI2ModeControllerLTEPowerLimitingEnable;
}

- (void)setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:(id)a3
{
}

- (unint64_t)wcmCellularLAACoexProtectCQIPeriod
{
  return self->_wcmCellularLAACoexProtectCQIPeriod;
}

- (void)setWcmCellularLAACoexProtectCQIPeriod:(unint64_t)a3
{
  self->_wcmCellularLAACoexProtectCQIPeriod = a3;
}

- (unint64_t)wcmCellularLAACoexThresholdIn
{
  return self->_wcmCellularLAACoexThresholdIn;
}

- (void)setWcmCellularLAACoexThresholdIn:(unint64_t)a3
{
  self->_wcmCellularLAACoexThresholdIn = a3;
}

- (unint64_t)wcmCellularLAACoexThresholdOut
{
  return self->_wcmCellularLAACoexThresholdOut;
}

- (void)setWcmCellularLAACoexThresholdOut:(unint64_t)a3
{
  self->_wcmCellularLAACoexThresholdOut = a3;
}

- (unint64_t)wcmCellularLAACoexDeactTimer
{
  return self->_wcmCellularLAACoexDeactTimer;
}

- (void)setWcmCellularLAACoexDeactTimer:(unint64_t)a3
{
  self->_wcmCellularLAACoexDeactTimer = a3;
}

- (unint64_t)wcmCellularLAACoexDeactStopTimer
{
  return self->_wcmCellularLAACoexDeactStopTimer;
}

- (void)setWcmCellularLAACoexDeactStopTimer:(unint64_t)a3
{
  self->_wcmCellularLAACoexDeactStopTimer = a3;
}

- (void)setWcmCellularCoexB7DLRange:(id)a3
{
  self->_wcmCellularCoexB7DLRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB7ULRange
{
  double begin = self->_wcmCellularCoexB7ULRange._begin;
  double length = self->_wcmCellularCoexB7ULRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB7ULRange:(id)a3
{
  self->_wcmCellularCoexB7ULRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40ARange
{
  double begin = self->_wcmCellularCoexB40ARange._begin;
  double length = self->_wcmCellularCoexB40ARange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB40ARange:(id)a3
{
  self->_wcmCellularCoexB40ARange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB40BRange
{
  double begin = self->_wcmCellularCoexB40BRange._begin;
  double length = self->_wcmCellularCoexB40BRange._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB40BRange:(id)a3
{
  self->_wcmCellularCoexB40BRange = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A1Range
{
  double begin = self->_wcmCellularCoexB41A1Range._begin;
  double length = self->_wcmCellularCoexB41A1Range._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB41A1Range:(id)a3
{
  self->_wcmCellularCoexB41A1Range = ($47645E746BBB427C021E7CC331F21488)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)wcmCellularCoexB41A2Range
{
  double begin = self->_wcmCellularCoexB41A2Range._begin;
  double length = self->_wcmCellularCoexB41A2Range._length;
  result.var1 = length;
  result.var0 = begin;
  return result;
}

- (void)setWcmCellularCoexB41A2Range:(id)a3
{
  self->_wcmCellularCoexB41A2Range = ($47645E746BBB427C021E7CC331F21488)a3;
}

- (NSArray)wcmCellularScanProtectionCellFrequencies
{
  return self->_wcmCellularScanProtectionCellFrequencies;
}

- (void)setWcmCellularScanProtectionCellFrequencies:(id)a3
{
}

- (NSArray)wcmCellularScanProtectionWiFiChannels
{
  return self->_wcmCellularScanProtectionWiFiChannels;
}

- (void)setWcmCellularScanProtectionWiFiChannels:(id)a3
{
}

- (NSArray)wcmCellularScanProtectionWiFiChannelsWiFiEnh
{
  return self->_wcmCellularScanProtectionWiFiChannelsWiFiEnh;
}

- (void)setWcmCellularScanProtectionWiFiChannelsWiFiEnh:(id)a3
{
}

- (NSArray)wcmWiFiScanThrottlingChannelIndices
{
  return self->_wcmWiFiScanThrottlingChannelIndices;
}

- (void)setWcmWiFiScanThrottlingChannelIndices:(id)a3
{
}

- (NSNumber)wcmCellularScanProtectionWiFiMaxDuration
{
  return self->_wcmCellularScanProtectionWiFiMaxDuration;
}

- (void)setWcmCellularScanProtectionWiFiMaxDuration:(id)a3
{
}

- (NSArray)wcmCellularScanProtectionCellFrequenciesforBT
{
  return self->_wcmCellularScanProtectionCellFrequenciesforBT;
}

- (void)setWcmCellularScanProtectionCellFrequenciesforBT:(id)a3
{
}

- (unint64_t)wcmCellularWCI2PlatformPolicyBitmap
{
  return self->_wcmCellularWCI2PlatformPolicyBitmap;
}

- (void)setWcmCellularWCI2PlatformPolicyBitmap:(unint64_t)a3
{
  self->_wcmCellularWCI2PlatformPolicyBitmap = a3;
}

- (void)setWcmGen9rFemDefaultMode2gWiFiCellularbands:(id)a3
{
}

- (void)setWcmGen9rFemDefaultMode5gWiFiCellularbands:(id)a3
{
}

- (void)setSKU
{
  [(WCM_PlatformManager *)self setWrmSku:8];
  CFDictionaryRef v3 = [(id)MGCopyAnswer() UTF8String];
  if (v3)
  {
    int v4 = (char)*v3;
    if (*v3)
    {
      if ((v4 - 65) > 3)
      {
        uint64_t v5 = 8;
        NSLog(@"Unknown SKU \n");
      }
      else
      {
        uint64_t v5 = (v4 - 64);
        NSLog(&off_100211C78[v4 - 65]->isa);
      }
      [(WCM_PlatformManager *)self setWrmSku:v5];
    }
  }
}

- (void)setPlatform
{
  uint64_t v3 = MGGetProductType();
  [(WCM_PlatformManager *)self setWrmPlatformId:1000];
  if (v3 <= 2309863437)
  {
    if (v3 <= 1408738133)
    {
      if (v3 > 810906662)
      {
        if (v3 <= 1280441782)
        {
          if (v3 <= 910181309)
          {
            switch(v3)
            {
              case 810906663:
                int v4 = self;
                uint64_t v5 = 161;
                break;
              case 820711327:
                int v4 = self;
                uint64_t v5 = 59;
                break;
              case 851437781:
                int v4 = self;
                uint64_t v5 = 54;
                break;
              default:
                goto LABEL_302;
            }
            goto LABEL_301;
          }
          if (v3 > 1169082143)
          {
            if (v3 == 1169082144)
            {
              int v4 = self;
              uint64_t v5 = 13;
            }
            else
            {
              if (v3 != 1234705395) {
                goto LABEL_302;
              }
              int v4 = self;
              uint64_t v5 = 2;
            }
            goto LABEL_301;
          }
          if (v3 != 910181310)
          {
            if (v3 != 1060988941) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 16;
            goto LABEL_301;
          }
          goto LABEL_213;
        }
        if (v3 <= 1309571157)
        {
          if (v3 > 1293446024)
          {
            if (v3 == 1293446025)
            {
              int v4 = self;
              uint64_t v5 = 136;
            }
            else
            {
              if (v3 != 1294429942) {
                goto LABEL_302;
              }
              int v4 = self;
              uint64_t v5 = 239;
            }
            goto LABEL_301;
          }
          if (v3 == 1280441783)
          {
            int v4 = self;
            uint64_t v5 = 121;
            goto LABEL_301;
          }
          uint64_t v7 = 1280909812;
LABEL_166:
          if (v3 != v7) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 223;
          goto LABEL_301;
        }
        if (v3 <= 1371389548)
        {
          if (v3 == 1309571158)
          {
            int v4 = self;
            uint64_t v5 = 242;
            goto LABEL_301;
          }
          uint64_t v6 = 1353145733;
          goto LABEL_124;
        }
        if (v3 == 1371389549)
        {
          int v4 = self;
          uint64_t v5 = 5;
          goto LABEL_301;
        }
        uint64_t v8 = 1373516433;
LABEL_232:
        if (v3 != v8) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 148;
        goto LABEL_301;
      }
      if (v3 <= 341800272)
      {
        if (v3 <= 133314239)
        {
          switch(v3)
          {
            case -1:
              NSLog(@"Unknown Product\n");
              goto LABEL_302;
            case 79936591:
              int v4 = self;
              uint64_t v5 = 61;
              break;
            case 88647037:
              int v4 = self;
              uint64_t v5 = 120;
              break;
            default:
              goto LABEL_302;
          }
        }
        else if (v3 > 228444037)
        {
          if (v3 == 228444038)
          {
            int v4 = self;
            uint64_t v5 = 127;
          }
          else
          {
            if (v3 != 330877086) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 57;
          }
        }
        else if (v3 == 133314240)
        {
          int v4 = self;
          uint64_t v5 = 52;
        }
        else
        {
          if (v3 != 157833461) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 122;
        }
        goto LABEL_301;
      }
      if (v3 <= 676119127)
      {
        if (v3 > 555503453)
        {
          if (v3 == 555503454)
          {
            int v4 = self;
            uint64_t v5 = 168;
          }
          else
          {
            if (v3 != 574536383) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 55;
          }
          goto LABEL_301;
        }
        if (v3 != 341800273)
        {
          if (v3 != 425046865) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 231;
          goto LABEL_301;
        }
        goto LABEL_217;
      }
      if (v3 <= 746003605)
      {
        if (v3 == 676119128)
        {
          int v4 = self;
          uint64_t v5 = 240;
        }
        else
        {
          if (v3 != 689804742) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 18;
        }
        goto LABEL_301;
      }
      if (v3 != 746003606)
      {
        if (v3 != 749116821) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 263;
        goto LABEL_301;
      }
    }
    else
    {
      if (v3 > 1990293941)
      {
        if (v3 > 2085054104)
        {
          if (v3 <= 2158787295)
          {
            if (v3 > 2103978417)
            {
              if (v3 == 2103978418)
              {
                int v4 = self;
                uint64_t v5 = 137;
              }
              else
              {
                if (v3 != 2132302344) {
                  goto LABEL_302;
                }
                int v4 = self;
                uint64_t v5 = 224;
              }
            }
            else if (v3 == 2085054105)
            {
              int v4 = self;
              uint64_t v5 = 228;
            }
            else
            {
              if (v3 != 2089455188) {
                goto LABEL_302;
              }
              int v4 = self;
              uint64_t v5 = 157;
            }
            goto LABEL_301;
          }
          if (v3 <= 2236272847)
          {
            if (v3 == 2158787296)
            {
              int v4 = self;
              uint64_t v5 = 58;
            }
            else
            {
              if (v3 != 2159747553) {
                goto LABEL_302;
              }
              int v4 = self;
              uint64_t v5 = 10;
            }
            goto LABEL_301;
          }
          if (v3 != 2236272848)
          {
            if (v3 != 2262113699) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 60;
            goto LABEL_301;
          }
          goto LABEL_240;
        }
        if (v3 <= 2032616840)
        {
          if (v3 > 2021146988)
          {
            if (v3 == 2021146989)
            {
              int v4 = self;
              uint64_t v5 = 22;
              goto LABEL_301;
            }
            if (v3 != 2023824667) {
              goto LABEL_302;
            }
            goto LABEL_163;
          }
          if (v3 == 1990293942)
          {
            int v4 = self;
            uint64_t v5 = 241;
            goto LABEL_301;
          }
          uint64_t v6 = 2001966017;
LABEL_124:
          if (v3 != v6) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 134;
          goto LABEL_301;
        }
        if (v3 > 2080700390)
        {
          if (v3 == 2080700391)
          {
            int v4 = self;
            uint64_t v5 = 3;
          }
          else
          {
            if (v3 != 2084894489) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 261;
          }
          goto LABEL_301;
        }
        if (v3 != 2032616841)
        {
          if (v3 != 2078329141) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 21;
          goto LABEL_301;
        }
LABEL_213:
        int v4 = self;
        uint64_t v5 = 1;
        goto LABEL_301;
      }
      if (v3 <= 1625227433)
      {
        if (v3 <= 1434404432)
        {
          switch(v3)
          {
            case 1408738134:
              int v4 = self;
              uint64_t v5 = 220;
              break;
            case 1415625992:
              int v4 = self;
              uint64_t v5 = 176;
              break;
            case 1419435331:
              int v4 = self;
              uint64_t v5 = 178;
              break;
            default:
              goto LABEL_302;
          }
        }
        else if (v3 > 1602181455)
        {
          if (v3 == 1602181456)
          {
            int v4 = self;
            uint64_t v5 = 222;
          }
          else
          {
            if (v3 != 1608945770) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 159;
          }
        }
        else if (v3 == 1434404433)
        {
          int v4 = self;
          uint64_t v5 = 23;
        }
        else
        {
          if (v3 != 1554479185) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 266;
        }
        goto LABEL_301;
      }
      if (v3 <= 1834147426)
      {
        if (v3 > 1756509289)
        {
          if (v3 == 1756509290)
          {
            int v4 = self;
            uint64_t v5 = 180;
          }
          else
          {
            if (v3 != 1770142589) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 260;
          }
        }
        else if (v3 == 1625227434)
        {
          int v4 = self;
          uint64_t v5 = 154;
        }
        else
        {
          if (v3 != 1644180312) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 179;
        }
        goto LABEL_301;
      }
      if (v3 > 1878257789)
      {
        if (v3 == 1878257790)
        {
          int v4 = self;
          uint64_t v5 = 131;
        }
        else
        {
          if (v3 != 1895344378) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 144;
        }
        goto LABEL_301;
      }
      if (v3 != 1834147427)
      {
        uint64_t v8 = 1868379043;
        goto LABEL_232;
      }
    }
    int v4 = self;
    uint64_t v5 = 150;
    goto LABEL_301;
  }
  if (v3 > 3215673113)
  {
    if (v3 <= 3711192743)
    {
      if (v3 <= 3571532205)
      {
        if (v3 <= 3361025852)
        {
          switch(v3)
          {
            case 3215673114:
              int v4 = self;
              uint64_t v5 = 129;
              break;
            case 3228373941:
              int v4 = self;
              uint64_t v5 = 153;
              break;
            case 3241053352:
              int v4 = self;
              uint64_t v5 = 169;
              break;
            default:
              goto LABEL_302;
          }
        }
        else if (v3 > 3455223060)
        {
          if (v3 == 3455223061)
          {
            int v4 = self;
            uint64_t v5 = 142;
          }
          else
          {
            if (v3 != 3540156652) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 146;
          }
        }
        else if (v3 == 3361025853)
        {
          int v4 = self;
          uint64_t v5 = 156;
        }
        else
        {
          if (v3 != 3397214291) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 128;
        }
        goto LABEL_301;
      }
      if (v3 > 3645319984)
      {
        if (v3 > 3677894690)
        {
          if (v3 == 3677894691)
          {
            int v4 = self;
            uint64_t v5 = 163;
          }
          else
          {
            if (v3 != 3683904382) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 175;
          }
        }
        else if (v3 == 3645319985)
        {
          int v4 = self;
          uint64_t v5 = 125;
        }
        else
        {
          if (v3 != 3663011141) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 230;
        }
        goto LABEL_301;
      }
      if (v3 <= 3599094682)
      {
        if (v3 == 3571532206)
        {
          int v4 = self;
          uint64_t v5 = 181;
        }
        else
        {
          if (v3 != 3585085679) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 17;
        }
        goto LABEL_301;
      }
      if (v3 == 3599094683)
      {
        int v4 = self;
        uint64_t v5 = 138;
        goto LABEL_301;
      }
      if (v3 != 3636345305) {
        goto LABEL_302;
      }
      [(WCM_PlatformManager *)self setWrmPlatformId:132];
      goto LABEL_240;
    }
    if (v3 > 3863625341)
    {
      if (v3 > 4068102501)
      {
        if (v3 > 4201643248)
        {
          if (v3 == 4201643249)
          {
            int v4 = self;
            uint64_t v5 = 15;
          }
          else
          {
            if (v3 != 4242862982) {
              goto LABEL_302;
            }
            int v4 = self;
            uint64_t v5 = 130;
          }
        }
        else if (v3 == 4068102502)
        {
          int v4 = self;
          uint64_t v5 = 265;
        }
        else
        {
          if (v3 != 4172444931) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 173;
        }
      }
      else if (v3 > 3885279869)
      {
        if (v3 == 3885279870)
        {
          int v4 = self;
          uint64_t v5 = 11;
        }
        else
        {
          if (v3 != 4025247511) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 174;
        }
      }
      else if (v3 == 3863625342)
      {
        int v4 = self;
        uint64_t v5 = 139;
      }
      else
      {
        if (v3 != 3867318491) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 244;
      }
      goto LABEL_301;
    }
    if (v3 <= 3801472100)
    {
      if (v3 <= 3743999267)
      {
        if (v3 == 3711192744)
        {
          int v4 = self;
          uint64_t v5 = 141;
        }
        else
        {
          if (v3 != 3742999858) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 229;
        }
        goto LABEL_301;
      }
      if (v3 == 3743999268)
      {
        int v4 = self;
        uint64_t v5 = 0;
        goto LABEL_301;
      }
      uint64_t v7 = 3767261006;
      goto LABEL_166;
    }
    if (v3 > 3825599859)
    {
      if (v3 == 3825599860)
      {
        int v4 = self;
        uint64_t v5 = 51;
      }
      else
      {
        if (v3 != 3839750255) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 262;
      }
      goto LABEL_301;
    }
    if (v3 != 3801472101)
    {
      if (v3 != 3819635030) {
        goto LABEL_302;
      }
      int v4 = self;
      uint64_t v5 = 227;
      goto LABEL_301;
    }
LABEL_217:
    int v4 = self;
    uint64_t v5 = 135;
    goto LABEL_301;
  }
  if (v3 <= 2722529671)
  {
    if (v3 <= 2619317133)
    {
      if (v3 <= 2487868871)
      {
        switch(v3)
        {
          case 2309863438:
            int v4 = self;
            uint64_t v5 = 19;
            break;
          case 2385671069:
            int v4 = self;
            uint64_t v5 = 124;
            break;
          case 2458172802:
            int v4 = self;
            uint64_t v5 = 132;
            break;
          default:
            goto LABEL_302;
        }
      }
      else if (v3 > 2566016328)
      {
        if (v3 == 2566016329)
        {
          int v4 = self;
          uint64_t v5 = 165;
        }
        else
        {
          if (v3 != 2614323575) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 123;
        }
      }
      else if (v3 == 2487868872)
      {
        int v4 = self;
        uint64_t v5 = 170;
      }
      else
      {
        if (v3 != 2516717268) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 126;
      }
      goto LABEL_301;
    }
    if (v3 > 2634105756)
    {
      if (v3 > 2673319455)
      {
        if (v3 == 2673319456)
        {
          int v4 = self;
          uint64_t v5 = 140;
        }
        else
        {
          if (v3 != 2688879999) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 25;
        }
      }
      else if (v3 == 2634105757)
      {
        int v4 = self;
        uint64_t v5 = 164;
      }
      else
      {
        if (v3 != 2644487444) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 145;
      }
      goto LABEL_301;
    }
    if (v3 > 2625074842)
    {
      if (v3 != 2625074843)
      {
        uint64_t v9 = 2628394914;
LABEL_184:
        if (v3 != v9) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 151;
        goto LABEL_301;
      }
      int v4 = self;
      uint64_t v5 = 243;
    }
    else if (v3 == 2619317134)
    {
      int v4 = self;
      uint64_t v5 = 167;
    }
    else
    {
      if (v3 != 2622433984) {
        goto LABEL_302;
      }
      int v4 = self;
      uint64_t v5 = 162;
    }
LABEL_301:
    [(WCM_PlatformManager *)v4 setWrmPlatformId:v5];
    goto LABEL_302;
  }
  if (v3 <= 2959111091)
  {
    if (v3 > 2903084587)
    {
      if (v3 > 2941181570)
      {
        if (v3 == 2941181571)
        {
          int v4 = self;
          uint64_t v5 = 53;
        }
        else
        {
          if (v3 != 2943112657) {
            goto LABEL_302;
          }
          int v4 = self;
          uint64_t v5 = 225;
        }
      }
      else if (v3 == 2903084588)
      {
        int v4 = self;
        uint64_t v5 = 143;
      }
      else
      {
        if (v3 != 2940697645) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 24;
      }
    }
    else if (v3 > 2793418700)
    {
      if (v3 == 2793418701)
      {
        int v4 = self;
        uint64_t v5 = 50;
      }
      else
      {
        if (v3 != 2795618603) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 56;
      }
    }
    else if (v3 == 2722529672)
    {
      int v4 = self;
      uint64_t v5 = 7;
    }
    else
    {
      if (v3 != 2751865418) {
        goto LABEL_302;
      }
      int v4 = self;
      uint64_t v5 = 177;
    }
    goto LABEL_301;
  }
  if (v3 <= 3101941569)
  {
    if (v3 <= 3001488777)
    {
      if (v3 == 2959111092)
      {
        int v4 = self;
        uint64_t v5 = 166;
      }
      else
      {
        if (v3 != 2979575960) {
          goto LABEL_302;
        }
        int v4 = self;
        uint64_t v5 = 221;
      }
      goto LABEL_301;
    }
    if (v3 != 3001488778)
    {
      uint64_t v9 = 3054476161;
      goto LABEL_184;
    }
    int v4 = self;
    uint64_t v5 = 14;
    goto LABEL_301;
  }
  if (v3 <= 3184375230)
  {
    if (v3 != 3101941570)
    {
      if (v3 != 3143587592) {
        goto LABEL_302;
      }
      int v4 = self;
      uint64_t v5 = 264;
      goto LABEL_301;
    }
LABEL_163:
    int v4 = self;
    uint64_t v5 = 147;
    goto LABEL_301;
  }
  if (v3 == 3184375231)
  {
    int v4 = self;
    uint64_t v5 = 62;
    goto LABEL_301;
  }
  if (v3 == 3196158497)
  {
LABEL_240:
    int v4 = self;
    uint64_t v5 = 133;
    goto LABEL_301;
  }
LABEL_302:

  [(WCM_PlatformManager *)self setSKU];
}

- (BOOL)isJapanSKU
{
  CFDictionaryRef v2 = (const void *)MGCopyAnswer();
  uint64_t v3 = v2;
  int v4 = "is not";
  if (v2)
  {
    int v5 = CFEqual(v2, @"B");
    BOOL v6 = v5 != 0;
    if (v5) {
      int v4 = "is";
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  +[WCM_Logging logLevel:5, @"This %s Japan SKU based on Device Variant %@", v4, v3 message];
  return v6;
}

- (BOOL)isRowSKUB
{
  CFDictionaryRef v2 = (const void *)MGCopyAnswer();
  uint64_t v3 = v2;
  int v4 = "is not";
  if (v2)
  {
    int v5 = CFEqual(v2, @"B");
    BOOL v6 = v5 != 0;
    if (v5) {
      int v4 = "is";
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  +[WCM_Logging logLevel:5, @"This %s a ROW SKU BDevice based on Device Variant %@", v4, v3 message];
  return v6;
}

- (BOOL)isRowSKUS
{
  CFDictionaryRef v2 = (const void *)MGCopyAnswer();
  uint64_t v3 = v2;
  int v4 = "is not";
  if (v2)
  {
    int v5 = CFEqual(v2, @"B");
    BOOL v6 = v5 != 0;
    if (v5) {
      int v4 = "is";
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  +[WCM_Logging logLevel:5, @"This %s a ROW SKU SDevice based on Device Variant %@", v4, v3 message];
  return v6;
}

- (void)loadStaticPolicyFor:(int)a3
{
  [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] removeAllObjects];
  [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Mode"];
  [(WCM_PlatformManager *)self setWcmWCI2FrameSyncAssertOffset:-60];
  [(WCM_PlatformManager *)self setWcmWCI2FrameSyncAssertJitter:3];
  [(WCM_PlatformManager *)self setWcmWCI2MWSRxAssertOffset:-40];
  [(WCM_PlatformManager *)self setWcmWCI2MWSRxAssertJitter:4];
  [(WCM_PlatformManager *)self setWcmWCI2MWSRxDeAssertOffset:-40];
  [(WCM_PlatformManager *)self setWcmWCI2MWSRxDeAssertJitter:4];
  [(WCM_PlatformManager *)self setWcmWCI2MWSTxAssertOffset:-50];
  [(WCM_PlatformManager *)self setWcmWCI2MWSTxAssertJitter:4];
  [(WCM_PlatformManager *)self setWcmWCI2MWSTxDeAssertOffset:-50];
  [(WCM_PlatformManager *)self setWcmWCI2MWSTxDeAssertJitter:4];
  [(WCM_PlatformManager *)self setWcmWCI2MWSPatternAssertOffset:0];
  [(WCM_PlatformManager *)self setWcmWCI2MWSPatternAssertJitter:0];
  [(WCM_PlatformManager *)self setWcmWCI2MWSInactivityAssertOffset:6790];
  [(WCM_PlatformManager *)self setWcmWCI2MWSInactivityAssertJitter:192];
  [(WCM_PlatformManager *)self setWcmWCI2MWSScanFrequencyAssertOffset:0];
  [(WCM_PlatformManager *)self setWcmWCI2MWSScanFrequencyAssertJitter:0];
  [(WCM_PlatformManager *)self setWcmWCI2MWSPriorityAssertOffsetRequest:500];
  [(WCM_PlatformManager *)self setWcmWiFiSupportFrameConfig:0];
  [(WCM_PlatformManager *)self setWcmWiFiSupportWciSignalingConfig:0];
  [(WCM_PlatformManager *)self setWcmWiFiB7BlocklistChannels:&off_10024EF80];
  [(WCM_PlatformManager *)self setWcmWiFiB7WCI2EnabledChannels:&off_10024EF98];
  [(WCM_PlatformManager *)self setWcmWiFiB40ABlocklistChannels:&off_10024EFB0];
  [(WCM_PlatformManager *)self setWcmWiFiB40AWCI2EnabledChannels:&off_10024EFC8];
  [(WCM_PlatformManager *)self setWcmWiFiB40BBlocklistChannels:&off_10024EFE0];
  [(WCM_PlatformManager *)self setWcmWiFiB40BWCI2EnabledChannels:&off_10024EFF8];
  [(WCM_PlatformManager *)self setWcmWiFiB41A1BlocklistChannels:&off_10024F010];
  [(WCM_PlatformManager *)self setWcmWiFiB41A1WCI2EnabledChannels:&off_10024F028];
  [(WCM_PlatformManager *)self setWcmWiFiB41A2BlocklistChannels:&off_10024F040];
  [(WCM_PlatformManager *)self setWcmWiFiB41A2WCI2EnabledChannels:&off_10024F058];
  [(WCM_PlatformManager *)self setWcmWiFiPriThresholdLow:&off_10023DC80];
  [(WCM_PlatformManager *)self setWcmWiFiPriThresholdMed:&off_10023DCB0];
  [(WCM_PlatformManager *)self setWcmWiFiPriThresholdHigh:&off_10023DCE0];
  [(WCM_PlatformManager *)self setWcmWiFiAntennaConfig:&off_10024F0A0];
  [(WCM_PlatformManager *)self setWcmWiFiAntennaCellPolicy:&off_10023DD58];
  [(WCM_PlatformManager *)self setWcmWiFiAntennaConfigDefault:&off_10024F0E8];
  [(WCM_PlatformManager *)self setWcmWiFiAntennaCellPolicyDefault:&off_10023DD58];
  [(WCM_PlatformManager *)self setWcmBTSupportTDDFrameConfig:0];
  [(WCM_PlatformManager *)self setWcmBTAFHMapDefault:sub_10008CDE4(&off_10024F100)];
  [(WCM_PlatformManager *)self setWcmBTB7AFHMap:sub_10008CDE4(&off_10024F118)];
  [(WCM_PlatformManager *)self setWcmBTB40AAFHMap:sub_10008CDE4(&off_10024F130)];
  [(WCM_PlatformManager *)self setWcmBTB40BAFHMap:sub_10008CDE4(&off_10024F148)];
  [(WCM_PlatformManager *)self setWcmBTB41A1AFHMap:sub_10008CDE4(&off_10024F160)];
  [(WCM_PlatformManager *)self setWcmBTB41A2AFHMap:sub_10008CDE4(&off_10024F178)];
  [(WCM_PlatformManager *)self setWcmHPCellularBTAFHMapFixed:sub_10008CDE4(&off_10024F190)];
  [(WCM_PlatformManager *)self setWcmBTPreferredRole:&off_10023DD70];
  [(WCM_PlatformManager *)self setWcmBTWCI2ModeSendMsgBitmap:255];
  [(WCM_PlatformManager *)self setWcmBTWCI2ModeRecvMsgBitmap:255];
  [(WCM_PlatformManager *)self setWcmBTAntBlockDuration:&off_10023DCF8];
  [(WCM_PlatformManager *)self setWcmHFBTChannelMapDefault:sub_10008CDE4(&off_10024F1A8)];
  [(WCM_PlatformManager *)self setWcmBTAntBlockEnableBandsDefault:&off_100254BF0];
  [(WCM_PlatformManager *)self setWcmBTDefaultAntenna:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfig:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfigParam1:+[NSNumber numberWithInt:4]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfigParam2:+[NSNumber numberWithInt:4]];
  [(WCM_PlatformManager *)self setWcmBTDefaultAntennaNonCoex:+[NSNumber numberWithInt:1]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfigNonCoex:+[NSNumber numberWithInt:3]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfigParam1NonCoex:+[NSNumber numberWithInt:4]];
  [(WCM_PlatformManager *)self setWcmBTAntennaConfigParam2NonCoex:+[NSNumber numberWithInt:4]];
  -[WCM_PlatformManager setWcmCellularCoexB7DLRange:](self, "setWcmCellularCoexB7DLRange:", 2620.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB7ULRange:](self, "setWcmCellularCoexB7ULRange:", 2500.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB40ARange:](self, "setWcmCellularCoexB40ARange:", 2340.0, 30.0);
  -[WCM_PlatformManager setWcmCellularCoexB40BRange:](self, "setWcmCellularCoexB40BRange:", 2370.0, 2401.0);
  -[WCM_PlatformManager setWcmCellularCoexB41A1Range:](self, "setWcmCellularCoexB41A1Range:", 2495.0, 5.0);
  -[WCM_PlatformManager setWcmCellularCoexB41A2Range:](self, "setWcmCellularCoexB41A2Range:", 2500.0, 50.0);
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModePolicy:+[NSNumber numberWithUnsignedLong:219]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModePowerThreshold:+[NSNumber numberWithInt:18]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeRBThresholdHigh:+[NSNumber numberWithInt:41]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeRBThresholdLow:+[NSNumber numberWithInt:37]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLTETxDenial:+[NSNumber numberWithInt:7]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeAPTTable:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeControllerTxPowerLimit:+[NSNumber numberWithInt:19]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeWCI2PowerLimit:+[NSNumber numberWithInt:19]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLinkPathLossThreshold:+[NSNumber numberWithInt:107]];
  LODWORD(v5) = 1028443341;
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeRBFilerAlpha:+[NSNumber numberWithFloat:v5]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeFilterRBThresholdHigh:+[NSNumber numberWithInt:41]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeFilterRBThresholdLow:+[NSNumber numberWithInt:37]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeControllerTxPowerLimitTO:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeWCI2PowerLimitTO:+[NSNumber numberWithInt:150]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeMaxAllowedFrameDenials:+[NSNumber numberWithInt:25]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeFrameDenialWindow:+[NSNumber numberWithInt:200]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeTxPowerThresholdAdvTx:+[NSNumber numberWithInt:19]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeRBThresholdAdvTx:+[NSNumber numberWithInt:41]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLTEMaxTxPowerHigh:+[NSNumber numberWithInt:30]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLTEMaxTxPowerLow:+[NSNumber numberWithInt:19]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeControllerLTERBThreshold:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeLTEHarqnackratioThreshold:+[NSNumber numberWithInt:0]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2ModeControllerLTEPowerLimitingEnable:+[NSNumber numberWithBool:0]];
  [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x100];
  [(WCM_PlatformManager *)self setWcmCellularScanProtectionCellFrequencies:&off_10024F208];
  [(WCM_PlatformManager *)self setWcmCellularScanProtectionWiFiChannels:&off_10024F268];
  switch(a3)
  {
    case 0:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      sub_10011E54C(self);
      return;
    case 1:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      sub_10011E7FC(self);
      return;
    case 2:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      sub_1001320D0(self);
      return;
    case 3:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_1001322F0(self);
      return;
    case 5:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011EAAC(self);
      return;
    case 7:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011ED60(self);
      return;
    case 10:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011F014(self);
      return;
    case 11:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011F57C(self);
      return;
    case 13:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011F830(self);
      return;
    case 14:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011FAE4(self);
      return;
    case 15:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LaaRcu1ThrottlingDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011FD98(self);
      return;
    case 16:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10012004C(self);
      return;
    case 17:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_1001209D0(self);
      return;
    case 18:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_100121354(self);
      return;
    case 19:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_100121CD8(self);
      return;
    case 20:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10011F2C8(self);
      return;
    case 21:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      sub_10012265C(self);
      return;
    case 22:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      sub_100124558(self);
      return;
    case 23:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      sub_100124FC8(self);
      return;
    case 24:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      sub_100123078(self);
      return;
    case 25:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];
      sub_100123AE8(self);
      return;
    case 50:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      sub_100127EB8(self);
      return;
    case 51:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      sub_1001272F8(self);
      return;
    case 52:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      sub_100125A38(self);
      return;
    case 53:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      sub_100126698(self);
      return;
    case 54:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      if (_os_feature_enabled_impl()) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGpsL1Level"];
      }
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTConditionId"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig2gWifiOnly"];
      sub_10012AF20(self);
      return;
    case 55:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand41Ch1113"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      if (_os_feature_enabled_impl()) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGpsL1Level"];
      }
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTConditionId"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig2gWifiOnly"];
      sub_10012A2E8(self);
      return;
    case 56:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTConditionId"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      if (_os_feature_enabled_impl()) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGpsL1Level"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig2gWifiOnly"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"COEX_MIC_RF_SUPPORT"];
      sub_100128A78(self);
      return;
    case 57:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPLLAIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTECDRXWiFiTimeSharing"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB21"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEDualSubCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEWiFiTimeSharingBand40bCh13"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21PolicyTuneup"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"hpcellularstatemonitorsupport"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTConditionId"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"IOKitCameraStateEvent"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      if (_os_feature_enabled_impl()) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGpsL1Level"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiGen9rFemConfig2gWifiOnly"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"COEX_MIC_RF_SUPPORT"];
      sub_1001296B0(self);
      return;
    case 58:
    case 60:
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"MedtronicSupport";
      goto LABEL_136;
    case 59:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      sub_1000FF88C(self);
      return;
    case 61:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      sub_1000FFB1C(self);
      return;
    case 62:
    case 123:
      goto LABEL_5;
    case 120:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV1_1Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      sub_1000FFC64(self);
      return;
    case 121:
    case 132:
    case 134:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
LABEL_5:
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"WiFiBTLimitedAggregation";
      goto LABEL_136;
    case 122:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV1_1Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      sub_100103D48(self);
      return;
    case 124:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      sub_1000FF9D4(self);
      return;
    case 125:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"WiFiBTeSCOLimitedAggregation11ax";
      goto LABEL_136;
    case 126:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation11ax"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v8 = self;
      goto LABEL_143;
    case 127:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV1_1Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation11ax"];
      sub_100106F0C(self);
      return;
    case 128:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation11ax"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v8 = self;
LABEL_143:
      sub_100106728(v8);
      return;
    case 129:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV1_1Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation11ax"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_100107B68(self);
      return;
    case 130:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_100108BD4(self);
      return;
    case 131:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      sub_1001094C0(self);
      return;
    case 133:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      sub_10010B188(self);
      return;
    case 135:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      sub_10010B3B8(self);
      return;
    case 136:
    case 138:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"WiFiBTeSCOLimitedAggregation";
      goto LABEL_136;
    case 137:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      sub_10010B5E8(self);
      return;
    case 139:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      sub_10010B8E4(self);
      return;
    case 140:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV1_1Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation11ax"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_100107100(self);
      return;
    case 141:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBt2gEnvelopeIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_100104790(self);
      return;
    case 142:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v9 = self;
      goto LABEL_193;
    case 143:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      sub_1000FFDAC(self);
      return;
    case 144:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      sub_1001006D4(self);
      return;
    case 145:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v9 = self;
      goto LABEL_193;
    case 146:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB21ClientAntennaBlocking"];
      sub_10010536C(self);
      return;
    case 147:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v9 = self;
      goto LABEL_193;
    case 148:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      sub_10010C6CC(self);
      return;
    case 149:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      sub_10010D9E8(self);
      return;
    case 150:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      uint64_t v9 = self;
LABEL_193:
      sub_100103E90(v9);
      return;
    case 151:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      sub_10010ED04(self);
      return;
    case 152:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      sub_100110020(self);
      return;
    case 153:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      uint64_t v10 = self;
      goto LABEL_244;
    case 154:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      sub_100111E24(self);
      return;
    case 155:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      sub_100113574(self);
      return;
    case 156:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      uint64_t v10 = self;
LABEL_244:
      sub_10011133C(v10);
      return;
    case 157:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      sub_100114CC4(self);
      return;
    case 158:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedGpsFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CTSacDriverNeedWiFiFreq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BBWCI2Type7mmWaveTxOn"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      sub_100116414(self);
      return;
    case 159:
    case 160:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_10010BBE0(self);
      return;
    case 161:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      uint64_t v11 = self;
      goto LABEL_282;
    case 162:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"PencilCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_10011B5DC(self);
      return;
    case 163:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      uint64_t v11 = self;
      goto LABEL_282;
    case 164:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"PencilCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_10011CD94(self);
      return;
    case 165:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_100101A84(self);
      return;
    case 166:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"PencilCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_1001025A4(self);
      return;
    case 167:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      uint64_t v11 = self;
      goto LABEL_282;
    case 168:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_10011866C(self);
      return;
    case 169:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"PencilCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      uint64_t v11 = self;
LABEL_282:
      sub_100117B64(v11);
      return;
    case 170:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU2SupportIntegrated"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNeedWiFiStatus"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTeSCOLimitedAggregation"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBTA2DPIndication"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTuningForGpsBB20"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOffFreqUpdate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntSelStatsAWDStats"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ANTSELSTATSAWDSTATSCAMigration"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20PolicyConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiWCI2BitmapV2Enabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFi5GHzType7NR79AntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEActiveScanPwrLmtEnabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB20LAAType5IndDisabled"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Bb20EndcSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiType7LTEMBAntBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFVGHzPDHLS"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiAWDWCI2CoexBitmap"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaSelectionV2Coex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularNWCfgCmdFilter"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTELAACoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularPowerLimiting"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiOCLSupportFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AntennaTunningForGps"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"AlwaysSetGPSState"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MedtronicSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"EnableULCA"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22ClientAntennaBlocking"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"OclPlistInput"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisablePhyRateBasedRxPriReq"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 0x200];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LegacyNonCoexBandBitmapFix"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBt5GProfile"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiFigaroCoex"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Type72GWiFiSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtectionBTseparate"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiEnhCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicySupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"SacPolicyJasperSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BB22BusAntMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CoexBBUnifiedSensorInfoSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"DisableBBLegacyGnssMessage"];
      if (_os_feature_enabled_impl())
      {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTCoex"];
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"HFBTOOBMASKING"];
      }
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"MavAntPolicyFramework"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WlanConditionId"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiScanProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiAssocProtectionModeSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"PencilCoexSupport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CFUseTddModeDuringFindMy"];
      sub_100119E24(self);
      return;
    case 171:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtULOFDMA"];
      if (![(WCM_PlatformManager *)self forceWiFiBTCoexToTDD]) {
        [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WiFiBtProfile"];
      }
      sub_10010A84C(self);
      return;
    case 172:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      sub_10012BB58(self);
      return;
    case 175:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012BC64(self);
      return;
    case 176:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012BF04(self);
      return;
    case 179:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      if ([(WCM_PlatformManager *)self isRowSKUB])
      {
        sub_10012C1A4(self);
      }
      else
      {
        sub_10012C444(self);
      }
      return;
    case 180:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      if ([(WCM_PlatformManager *)self isRowSKUS])
      {
        sub_10012C6E4(self);
      }
      else
      {
        sub_10012C984(self);
      }
      return;
    case 181:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012CC24(self);
      return;
    case 220:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012CEE8(self);
      return;
    case 221:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012D1AC(self);
      return;
    case 222:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012D7C8(self);
      return;
    case 223:
    case 224:
    case 225:
    case 230:
    case 231:
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"RCU1Support";
      goto LABEL_136;
    case 227:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012F60C(self);
      return;
    case 228:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012EFF0(self);
      return;
    case 229:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012E9D4(self);
      return;
    case 238:
      +[WCM_Logging logLevel:2, @"YYDebug_ Platform ID = %d ", 238 message];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_100131AB4(self);
      return;
    case 239:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012E3DC(self);
      return;
    case 240:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012DDE4(self);
      return;
    case 243:
    case 244:
    case 263:
    case 264:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      BOOL v6 = [(WCM_PlatformManager *)self wcmCoexFeatures];
      CFStringRef v7 = @"RCU1R2Support";
LABEL_136:
      [(NSMutableSet *)v6 addObject:v7];
      break;
    case 260:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_100130244(self);
      break;
    case 261:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_10012FC28(self);
      break;
    case 262:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_100131498(self);
      break;
    case 265:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_100130860(self);
      break;
    case 266:
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"LTEScanProtection"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"RCU1R2Support"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTUseC0B1AntennaConfig"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WCI2Type7ShortBit"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ProtectWiFiRanging"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WifiBtAgcCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularWatchFcmBcmAntennaReport"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"Wifi5gChannelMapping"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BLEAFHMapConversion"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"BTSeparateAGCCoexMode"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"ClkAlgnTDDFix"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"charging_desense"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"WatchReportRC1IssueChannel"];
      [(NSMutableSet *)[(WCM_PlatformManager *)self wcmCoexFeatures] addObject:@"CellularRC1PolicyManager"];
      [(WCM_PlatformManager *)self setWcmCellularWCI2PlatformPolicyBitmap:[(WCM_PlatformManager *)self wcmCellularWCI2PlatformPolicyBitmap] | 1];
      sub_100130E7C(self);
      break;
    default:
      return;
  }
}

@end