@interface WiFiUsageLQMUserSample
+ (id)allLQMProperties;
+ (id)featureFromFieldName:(id)a3;
- (BOOL)isAnyAppInFG;
- (BOOL)isBSPActive;
- (BOOL)isBspSampleDurationExpected:(unint64_t)a3;
- (BOOL)isFTactive;
- (BOOL)isP2PActiveBSP;
- (BOOL)isScanActiveBSP;
- (BOOL)isTimeSensitiveAppRunning;
- (NSDate)timestamp;
- (NSMutableArray)mloSamples;
- (NSString)fgApp;
- (NSString)interfaceName;
- (NSString)motionState;
- (WiFiUsageBssDetails)bssDetails;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageLQMUserSample)initWithInterfaceName:(id)a3;
- (WiFiUsageNetworkDetails)networkDetails;
- (id)asDictionaryInto:(id)a3;
- (id)description;
- (int64_t)diff_noise_core0;
- (int64_t)diff_noise_core1;
- (int64_t)diff_noisecore1_noisecore0;
- (int64_t)diff_rssi_core0;
- (int64_t)diff_rssi_core1;
- (int64_t)diff_rssicore1_rssicore0;
- (int64_t)noise;
- (int64_t)noise_core0;
- (int64_t)noise_core1;
- (int64_t)rssi;
- (int64_t)rssiForTD;
- (int64_t)rssi_core0;
- (int64_t)rssi_core1;
- (int64_t)snr;
- (unint64_t)beaconPer;
- (unint64_t)bspAvgMuteMS;
- (unint64_t)bspErrorPercentage;
- (unint64_t)bspMaxConsecutiveFails;
- (unint64_t)bspMaxMuteMS;
- (unint64_t)bspMutePercentage;
- (unint64_t)bspRejectOrFailPercentageOfTriggers;
- (unint64_t)bspTimeOutPercentageOfTriggers;
- (unint64_t)bspTimeToTST;
- (unint64_t)bspTriggerCount;
- (unint64_t)chanQualScore;
- (unint64_t)decodingAttempts;
- (unint64_t)driverRoamRecommended;
- (unint64_t)driverTDrecommended;
- (unint64_t)duration;
- (unint64_t)interference;
- (unint64_t)linkTheoreticalMaxRate;
- (unint64_t)otherCca;
- (unint64_t)perCoreRssiInUse;
- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage;
- (unint64_t)rxBytes;
- (unint64_t)rxBytesOverRxFrames;
- (unint64_t)rxBytesOverRxL3Packets;
- (unint64_t)rxBytesSecondary;
- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage;
- (unint64_t)rxFrames;
- (unint64_t)rxL3Packets;
- (unint64_t)rxLatencyScore;
- (unint64_t)rxLossScore;
- (unint64_t)rxRate;
- (unint64_t)rxRateOverDeviceTheoreticalMaxPercentage;
- (unint64_t)rxRateOverLinkTheoreticalMaxPercentage;
- (unint64_t)rxRetriesOverRxFrames;
- (unint64_t)rxStartOverDecodingAttemptsPercentage;
- (unint64_t)selfCca;
- (unint64_t)totalReportedCca;
- (unint64_t)trafficState;
- (unint64_t)txBytes;
- (unint64_t)txBytesOverTxFrames;
- (unint64_t)txBytesOverTxL3Packets;
- (unint64_t)txBytesSecondary;
- (unint64_t)txFailsOverTxFrames;
- (unint64_t)txFrames;
- (unint64_t)txL3Packets;
- (unint64_t)txLatencyP95;
- (unint64_t)txLatencyScore;
- (unint64_t)txLossScore;
- (unint64_t)txMpduDensity;
- (unint64_t)txRTS;
- (unint64_t)txRTSFailOvertxRTS;
- (unint64_t)txRate;
- (unint64_t)txRateOverDeviceTheoreticalMaxPercentage;
- (unint64_t)txRateOverLinkTheoreticalMaxPercentage;
- (unint64_t)txRetriesOverTxFrames;
- (void)appendBSSDetailsToDict:(id)a3;
- (void)appendNetworkDetailsToDict:(id)a3;
- (void)populateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 BspMaxConsecutiveFails:(unint64_t)a16;
- (void)populateWithMotionState:(id)a3 andAppState:(id)a4;
- (void)populateWithPerMLOLinkStats:(apple_mlo_link_lqm *)a3;
- (void)populateWithRssi:(int64_t)a3 noise:(int64_t)a4 snr:(int64_t)a5 selfCca:(unint64_t)a6 otherCca:(unint64_t)a7 interference:(unint64_t)a8 totalReportedCca:(unint64_t)a9 beaconPer:(unint64_t)a10 rxCrsGlitch:(unint64_t)a11 rxBadPLCP:(unint64_t)a12 rxStart:(unint64_t)a13 sampleDuration:(unint64_t)a14;
- (void)populateWithRssi:(int64_t)a3 rssi0:(int64_t)a4 rssi1:(int64_t)a5 rssiMode:(unint64_t)a6 noise:(int64_t)a7 noise0:(int64_t)a8 noise1:(int64_t)a9 snr:(int64_t)a10 selfCca:(unint64_t)a11 otherCca:(unint64_t)a12 interference:(unint64_t)a13 totalReportedCca:(unint64_t)a14 beaconPer:(unint64_t)a15 rxCrsGlitch:(unint64_t)a16 rxBadPLCP:(unint64_t)a17 rxStart:(unint64_t)a18 rxBphyCrsGlitch:(unint64_t)a19 rxBphyBadPLCP:(unint64_t)a20 sampleDuration:(unint64_t)a21;
- (void)populateWithTxFrames:(unint64_t)a3 RxFrames:(unint64_t)a4 TxFails:(unint64_t)a5 TxRetries:(unint64_t)a6 RxRetries:(unint64_t)a7 TxRate:(unint64_t)a8 RxRate:(unint64_t)a9 txRTS:(unint64_t)a10 txRTSFail:(unint64_t)a11 txMpdu:(unint64_t)a12 txAMPDU:(unint64_t)a13;
- (void)setBeaconPer:(unint64_t)a3;
- (void)setBspAvgMuteMS:(unint64_t)a3;
- (void)setBspErrorPercentage:(unint64_t)a3;
- (void)setBspMaxConsecutiveFails:(unint64_t)a3;
- (void)setBspMaxMuteMS:(unint64_t)a3;
- (void)setBspMutePercentage:(unint64_t)a3;
- (void)setBspRejectOrFailPercentageOfTriggers:(unint64_t)a3;
- (void)setBspTimeOutPercentageOfTriggers:(unint64_t)a3;
- (void)setBspTimeToTST:(unint64_t)a3;
- (void)setBspTriggerCount:(unint64_t)a3;
- (void)setBssDetails:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChanQualScore:(unint64_t)a3;
- (void)setDecodingAttempts:(unint64_t)a3;
- (void)setDiff_noise_core0:(int64_t)a3;
- (void)setDiff_noise_core1:(int64_t)a3;
- (void)setDiff_noisecore1_noisecore0:(int64_t)a3;
- (void)setDiff_rssi_core0:(int64_t)a3;
- (void)setDiff_rssi_core1:(int64_t)a3;
- (void)setDiff_rssicore1_rssicore0:(int64_t)a3;
- (void)setDriverRoamRecommended:(unint64_t)a3;
- (void)setDriverTDrecommended:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setFgApp:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterference:(unint64_t)a3;
- (void)setIsAnyAppInFG:(BOOL)a3;
- (void)setIsBSPActive:(BOOL)a3;
- (void)setIsFTactive:(BOOL)a3;
- (void)setIsP2PActiveBSP:(BOOL)a3;
- (void)setIsScanActiveBSP:(BOOL)a3;
- (void)setIsTimeSensitiveAppRunning:(BOOL)a3;
- (void)setLinkTheoreticalMaxRate:(unint64_t)a3;
- (void)setMloSamples:(id)a3;
- (void)setMotionState:(id)a3;
- (void)setNetworkDetails:(id)a3;
- (void)setNoise:(int64_t)a3;
- (void)setNoise_core0:(int64_t)a3;
- (void)setNoise_core1:(int64_t)a3;
- (void)setOtherCca:(unint64_t)a3;
- (void)setPerCoreRssiInUse:(unint64_t)a3;
- (void)setRssi:(int64_t)a3;
- (void)setRssi_core0:(int64_t)a3;
- (void)setRssi_core1:(int64_t)a3;
- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxBytesOverRxFrames:(unint64_t)a3;
- (void)setRxBytesOverRxL3Packets:(unint64_t)a3;
- (void)setRxBytesSecondary:(unint64_t)a3;
- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxFrames:(unint64_t)a3;
- (void)setRxL3Packets:(unint64_t)a3;
- (void)setRxLatencyScore:(unint64_t)a3;
- (void)setRxLossScore:(unint64_t)a3;
- (void)setRxRate:(unint64_t)a3;
- (void)setRxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setRxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setRxRetriesOverRxFrames:(unint64_t)a3;
- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setSelfCca:(unint64_t)a3;
- (void)setSnr:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTotalReportedCca:(unint64_t)a3;
- (void)setTrafficState:(unint64_t)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxBytesOverTxFrames:(unint64_t)a3;
- (void)setTxBytesOverTxL3Packets:(unint64_t)a3;
- (void)setTxBytesSecondary:(unint64_t)a3;
- (void)setTxFailsOverTxFrames:(unint64_t)a3;
- (void)setTxFrames:(unint64_t)a3;
- (void)setTxL3Packets:(unint64_t)a3;
- (void)setTxLatencyP95:(unint64_t)a3;
- (void)setTxLatencyScore:(unint64_t)a3;
- (void)setTxLossScore:(unint64_t)a3;
- (void)setTxMpduDensity:(unint64_t)a3;
- (void)setTxRTS:(unint64_t)a3;
- (void)setTxRTSFailOvertxRTS:(unint64_t)a3;
- (void)setTxRate:(unint64_t)a3;
- (void)setTxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setTxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3;
- (void)setTxRetriesOverTxFrames:(unint64_t)a3;
- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10;
- (void)updateWithInterfaceCapabilities:(id)a3 AndNetworkDetails:(id)a4;
- (void)updateWithTxBytes:(unint64_t)a3 RxBytes:(unint64_t)a4 TxL3Packets:(unint64_t)a5 RxL3Packets:(unint64_t)a6 txBytesSecondary:(unint64_t)a7 rxBytesSecondary:(unint64_t)a8;
@end

@implementation WiFiUsageLQMUserSample

- (NSString)fgApp
{
  return self->_fgApp;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)txL3Packets
{
  return self->_txL3Packets;
}

- (unint64_t)txRateOverDeviceTheoreticalMaxPercentage
{
  return self->_txRateOverDeviceTheoreticalMaxPercentage;
}

- (unint64_t)rxRateOverDeviceTheoreticalMaxPercentage
{
  return self->_rxRateOverDeviceTheoreticalMaxPercentage;
}

- (unint64_t)driverTDrecommended
{
  return self->_driverTDrecommended;
}

- (int64_t)rssi_core0
{
  return self->_rssi_core0;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (int64_t)rssi_core1
{
  return self->_rssi_core1;
}

- (unint64_t)txRetriesOverTxFrames
{
  return self->_txRetriesOverTxFrames;
}

- (unint64_t)txRate
{
  return self->_txRate;
}

- (unint64_t)txFrames
{
  return self->_txFrames;
}

- (unint64_t)txFailsOverTxFrames
{
  return self->_txFailsOverTxFrames;
}

- (unint64_t)txBytesOverTxFrames
{
  return self->_txBytesOverTxFrames;
}

- (unint64_t)totalReportedCca
{
  return self->_totalReportedCca;
}

- (int64_t)snr
{
  return self->_snr;
}

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (unint64_t)rxRetriesOverRxFrames
{
  return self->_rxRetriesOverRxFrames;
}

- (unint64_t)rxRate
{
  return self->_rxRate;
}

- (unint64_t)rxFrames
{
  return self->_rxFrames;
}

- (unint64_t)rxBytesOverRxFrames
{
  return self->_rxBytesOverRxFrames;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (int64_t)noise
{
  return self->_noise;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (unint64_t)beaconPer
{
  return self->_beaconPer;
}

- (void)updateWithTxBytes:(unint64_t)a3 RxBytes:(unint64_t)a4 TxL3Packets:(unint64_t)a5 RxL3Packets:(unint64_t)a6 txBytesSecondary:(unint64_t)a7 rxBytesSecondary:(unint64_t)a8
{
  [(WiFiUsageLQMUserSample *)self setTxBytesOverTxFrames:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3, self->_txFrames, +[WiFiUsageLQMTransformations byteScale] == 1)];
  [(WiFiUsageLQMUserSample *)self setRxBytesOverRxFrames:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a4, self->_rxFrames, +[WiFiUsageLQMTransformations byteScale] == 1)];
  [(WiFiUsageLQMUserSample *)self setTxBytesOverTxL3Packets:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3, a5, +[WiFiUsageLQMTransformations byteScale] == 1)];
  [(WiFiUsageLQMUserSample *)self setRxBytesOverRxL3Packets:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a4, a6, +[WiFiUsageLQMTransformations byteScale] == 1)];
  [(WiFiUsageLQMUserSample *)self setTxL3Packets:a5];
  [(WiFiUsageLQMUserSample *)self setRxL3Packets:a6];
  [(WiFiUsageLQMUserSample *)self setTxBytes:a3];
  [(WiFiUsageLQMUserSample *)self setRxBytes:a4];
  [(WiFiUsageLQMUserSample *)self setTxBytesSecondary:a7];

  [(WiFiUsageLQMUserSample *)self setRxBytesSecondary:a8];
}

- (void)updateWithInterfaceCapabilities:(id)a3 AndNetworkDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WiFiUsageLQMUserSample *)self setNetworkDetails:v7];
  v8 = [v7 connectedBss];

  [(WiFiUsageLQMUserSample *)self setBssDetails:v8];
  if (v6 && [(WiFiUsageBssDetails *)self->_bssDetails nSS] == 0x7FFFFFFFFFFFFFFFLL) {
    -[WiFiUsageBssDetails setNSS:](self->_bssDetails, "setNSS:", [v6 currentNumberOfSpatialStreams]);
  }
  [(WiFiUsageLQMUserSample *)self setCapabilities:v6];
  if (v6)
  {
    bssDetails = self->_bssDetails;
    if (bssDetails)
    {
      +[WiFiUsageLQMTransformations ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:](WiFiUsageLQMTransformations, "ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:", self->_txRate, self->_rxRate, 0, self->_txFrames, self->_rxFrames, -[WiFiUsageBssDetails nSS](bssDetails, "nSS"), -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"), __PAIR64__(-[WiFiUsageBssDetails band](self->_bssDetails, "band"), -[WiFiUsageBssDetails phyMode](self->_bssDetails, "phyMode")), [v6 maxInterfacePHYRate]);
      self->_txRateOverLinkTheoreticalMaxPercentage = 0;
      self->_rxRateOverLinkTheoreticalMaxPercentage = 0;
      self->_linkTheoreticalMaxRate = 0;
      self->_txRateOverDeviceTheoreticalMaxPercentage = 0;
      self->_rxRateOverDeviceTheoreticalMaxPercentage = 0;
    }
  }
}

- (void)setTxL3Packets:(unint64_t)a3
{
  self->_txL3Packets = a3;
}

- (void)setTxBytesSecondary:(unint64_t)a3
{
  self->_txBytesSecondary = a3;
}

- (void)setTxBytesOverTxL3Packets:(unint64_t)a3
{
  self->_txBytesOverTxL3Packets = a3;
}

- (void)setTxBytesOverTxFrames:(unint64_t)a3
{
  self->_txBytesOverTxFrames = a3;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (void)setRxL3Packets:(unint64_t)a3
{
  self->_rxL3Packets = a3;
}

- (void)setRxBytesSecondary:(unint64_t)a3
{
  self->_rxBytesSecondary = a3;
}

- (void)setRxBytesOverRxL3Packets:(unint64_t)a3
{
  self->_rxBytesOverRxL3Packets = a3;
}

- (void)setRxBytesOverRxFrames:(unint64_t)a3
{
  self->_rxBytesOverRxFrames = a3;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (void)setNetworkDetails:(id)a3
{
}

- (void)setCapabilities:(id)a3
{
}

- (void)setBssDetails:(id)a3
{
}

- (void)populateWithTxFrames:(unint64_t)a3 RxFrames:(unint64_t)a4 TxFails:(unint64_t)a5 TxRetries:(unint64_t)a6 RxRetries:(unint64_t)a7 TxRate:(unint64_t)a8 RxRate:(unint64_t)a9 txRTS:(unint64_t)a10 txRTSFail:(unint64_t)a11 txMpdu:(unint64_t)a12 txAMPDU:(unint64_t)a13
{
  -[WiFiUsageLQMUserSample setTxFrames:](self, "setTxFrames:");
  [(WiFiUsageLQMUserSample *)self setRxFrames:a4];
  [(WiFiUsageLQMUserSample *)self setTxRetriesOverTxFrames:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a6, a3, +[WiFiUsageLQMTransformations ratioScale])];
  [(WiFiUsageLQMUserSample *)self setRxRetriesOverRxFrames:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a7, a4, +[WiFiUsageLQMTransformations ratioScale])];
  [(WiFiUsageLQMUserSample *)self setTxFailsOverTxFrames:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a5, a3, +[WiFiUsageLQMTransformations ratioScale])];
  [(WiFiUsageLQMUserSample *)self setTxRate:+[WiFiUsageLQMTransformations validateRate:a8 frames:a3]];
  [(WiFiUsageLQMUserSample *)self setRxRate:+[WiFiUsageLQMTransformations validateRate:a9 frames:a4]];
  [(WiFiUsageLQMUserSample *)self setTxRTS:a10];
  [(WiFiUsageLQMUserSample *)self setTxRTSFailOvertxRTS:+[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a11, a10, +[WiFiUsageLQMTransformations ratioScale])];
  unint64_t v20 = +[WiFiUsageLQMTransformations ratioWithValue:a12 Over:a13 WithScale:1];

  [(WiFiUsageLQMUserSample *)self setTxMpduDensity:v20];
}

- (void)setTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_txRetriesOverTxFrames = a3;
}

- (void)setTxRate:(unint64_t)a3
{
  self->_txRate = a3;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (void)setTxRTS:(unint64_t)a3
{
  self->_txRTS = a3;
}

- (void)setTxFrames:(unint64_t)a3
{
  self->_txFrames = a3;
}

- (void)setTxFailsOverTxFrames:(unint64_t)a3
{
  self->_txFailsOverTxFrames = a3;
}

- (void)setRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_rxRetriesOverRxFrames = a3;
}

- (void)setRxRate:(unint64_t)a3
{
  self->_rxRate = a3;
}

- (void)setRxFrames:(unint64_t)a3
{
  self->_rxFrames = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (void)setFgApp:(id)a3
{
}

- (void)setTxMpduDensity:(unint64_t)a3
{
  self->_txMpduDensity = a3;
}

- (void)setIsFTactive:(BOOL)a3
{
  self->_isFTactive = a3;
}

- (void)populateWithMotionState:(id)a3 andAppState:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  [(WiFiUsageLQMUserSample *)self setMotionState:a3];
  [(WiFiUsageLQMUserSample *)self setIsTimeSensitiveAppRunning:(*(void *)&v4 & 0xFF0000) != 0];
  [(WiFiUsageLQMUserSample *)self setIsAnyAppInFG:v4 != 0];

  [(WiFiUsageLQMUserSample *)self setIsFTactive:(v4 & 0xFF00) != 0];
}

- (void)setMotionState:(id)a3
{
}

- (void)setIsTimeSensitiveAppRunning:(BOOL)a3
{
  self->_isTimeSensitiveAppRunning = a3;
}

- (void)setIsAnyAppInFG:(BOOL)a3
{
  self->_isAnyAppInFG = a3;
}

- (void)populateWithRssi:(int64_t)a3 noise:(int64_t)a4 snr:(int64_t)a5 selfCca:(unint64_t)a6 otherCca:(unint64_t)a7 interference:(unint64_t)a8 totalReportedCca:(unint64_t)a9 beaconPer:(unint64_t)a10 rxCrsGlitch:(unint64_t)a11 rxBadPLCP:(unint64_t)a12 rxStart:(unint64_t)a13 sampleDuration:(unint64_t)a14
{
  [(WiFiUsageLQMUserSample *)self setDuration:a14];
  if (a3) {
    int64_t v21 = a3;
  }
  else {
    int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(WiFiUsageLQMUserSample *)self setRssi:v21];
  if (a4) {
    int64_t v22 = a4;
  }
  else {
    int64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(WiFiUsageLQMUserSample *)self setNoise:v22];
  if (a5) {
    int64_t v23 = a5;
  }
  else {
    int64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(WiFiUsageLQMUserSample *)self setSnr:v23];
  [(WiFiUsageLQMUserSample *)self setSelfCca:a6];
  [(WiFiUsageLQMUserSample *)self setOtherCca:a7];
  [(WiFiUsageLQMUserSample *)self setInterference:a8];
  [(WiFiUsageLQMUserSample *)self setTotalReportedCca:a9];
  [(WiFiUsageLQMUserSample *)self setBeaconPer:a10];
  if (a11 == 0x7FFFFFFFFFFFFFFFLL || a12 == 0x7FFFFFFFFFFFFFFFLL || a13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0x7FFFFFFFFFFFFFFFLL, a12);
    [(WiFiUsageLQMUserSample *)self setRxStartOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
    [(WiFiUsageLQMUserSample *)self setRxBadPlcpOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
    [(WiFiUsageLQMUserSample *)self setRxCrsGlitchOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:](WiFiUsageLQMTransformations, "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    [(WiFiUsageLQMUserSample *)self setDecodingAttempts:0];
    [(WiFiUsageLQMUserSample *)self setRxStartOverDecodingAttemptsPercentage:0];
    [(WiFiUsageLQMUserSample *)self setRxBadPlcpOverDecodingAttemptsPercentage:0];
    [(WiFiUsageLQMUserSample *)self setRxCrsGlitchOverDecodingAttemptsPercentage:0];
  }
}

- (void)setTotalReportedCca:(unint64_t)a3
{
  self->_totalReportedCca = a3;
}

- (void)setSnr:(int64_t)a3
{
  self->_snr = a3;
}

- (void)setSelfCca:(unint64_t)a3
{
  self->_selfCca = a3;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setOtherCca:(unint64_t)a3
{
  self->_otherCca = a3;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (void)setInterference:(unint64_t)a3
{
  self->_interference = a3;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void)setBeaconPer:(unint64_t)a3
{
  self->_beaconPer = a3;
}

- (void)populateWithRssi:(int64_t)a3 rssi0:(int64_t)a4 rssi1:(int64_t)a5 rssiMode:(unint64_t)a6 noise:(int64_t)a7 noise0:(int64_t)a8 noise1:(int64_t)a9 snr:(int64_t)a10 selfCca:(unint64_t)a11 otherCca:(unint64_t)a12 interference:(unint64_t)a13 totalReportedCca:(unint64_t)a14 beaconPer:(unint64_t)a15 rxCrsGlitch:(unint64_t)a16 rxBadPLCP:(unint64_t)a17 rxStart:(unint64_t)a18 rxBphyCrsGlitch:(unint64_t)a19 rxBphyBadPLCP:(unint64_t)a20 sampleDuration:(unint64_t)a21
{
  [(WiFiUsageLQMUserSample *)self populateWithRssi:a3 noise:a7 snr:a10 selfCca:a11 otherCca:a12 interference:a13 totalReportedCca:a14 beaconPer:a15 rxCrsGlitch:a16 rxBadPLCP:a17 rxStart:a18 sampleDuration:a21];
  if (a4) {
    int64_t v25 = a4;
  }
  else {
    int64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_rssi_core0 = v25;
  if (a5) {
    int64_t v26 = a5;
  }
  else {
    int64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_rssi_core1 = v26;
  v34.receiver = self;
  v34.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssi_core0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v34, sel_class), "subtract:From:", self->_rssi_core0, self->_rssi);
  v33.receiver = self;
  v33.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssi_core1 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v33, sel_class), "subtract:From:", self->_rssi_core1, self->_rssi);
  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssicore1_rssicore0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v32, sel_class), "subtract:From:", self->_rssi_core0, self->_rssi_core1);
  if (a8) {
    int64_t v27 = a8;
  }
  else {
    int64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_noise_core0 = v27;
  if (a9) {
    int64_t v28 = a9;
  }
  else {
    int64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_noise_core1 = v28;
  v31.receiver = self;
  v31.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noise_core0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v31, sel_class), "subtract:From:", self->_noise_core0, self->_noise);
  v30.receiver = self;
  v30.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noise_core1 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v30, sel_class), "subtract:From:", self->_noise_core1, self->_noise);
  v29.receiver = self;
  v29.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noisecore1_noisecore0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v29, sel_class), "subtract:From:", self->_noise_core0, self->_noise_core1);
  if (a16 == 0x7FFFFFFFFFFFFFFFLL || a17 == 0x7FFFFFFFFFFFFFFFLL || a18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(WiFiUsageLQMUserSample *)self setDecodingAttempts:0x7FFFFFFFFFFFFFFFLL];
    [(WiFiUsageLQMUserSample *)self setRxStartOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
    [(WiFiUsageLQMUserSample *)self setRxBadPlcpOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
    [(WiFiUsageLQMUserSample *)self setRxCrsGlitchOverDecodingAttemptsPercentage:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:](WiFiUsageLQMTransformations, "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    [(WiFiUsageLQMUserSample *)self setDecodingAttempts:0];
    [(WiFiUsageLQMUserSample *)self setRxStartOverDecodingAttemptsPercentage:0];
    [(WiFiUsageLQMUserSample *)self setRxCrsGlitchOverDecodingAttemptsPercentage:0];
    [(WiFiUsageLQMUserSample *)self setRxBadPlcpOverDecodingAttemptsPercentage:0];
  }
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssDetails, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_mloSamples, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_motionState, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);

  objc_storeStrong((id *)&self->_networkDetails, 0);
}

- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10
{
  [(WiFiUsageLQMUserSample *)self setChanQualScore:a3];
  [(WiFiUsageLQMUserSample *)self setTxLatencyScore:a4];
  [(WiFiUsageLQMUserSample *)self setRxLatencyScore:a5];
  [(WiFiUsageLQMUserSample *)self setTxLossScore:a6];
  [(WiFiUsageLQMUserSample *)self setRxLossScore:a7];
  [(WiFiUsageLQMUserSample *)self setTxLatencyP95:a8];
  if (a9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = (a9 >> 1) & 1;
  }
  [(WiFiUsageLQMUserSample *)self setDriverRoamRecommended:(a9 != 0x7FFFFFFFFFFFFFFFLL) & a9];
  [(WiFiUsageLQMUserSample *)self setDriverTDrecommended:v16];

  [(WiFiUsageLQMUserSample *)self setTrafficState:a10];
}

- (void)setTxLossScore:(unint64_t)a3
{
  self->_txLossScore = a3;
}

- (void)setTxLatencyScore:(unint64_t)a3
{
  self->_txLatencyScore = a3;
}

- (void)setTxLatencyP95:(unint64_t)a3
{
  self->_txLatencyP95 = a3;
}

- (void)setTrafficState:(unint64_t)a3
{
  self->_trafficState = a3;
}

- (void)setRxLossScore:(unint64_t)a3
{
  self->_rxLossScore = a3;
}

- (void)setRxLatencyScore:(unint64_t)a3
{
  self->_rxLatencyScore = a3;
}

- (void)setDriverTDrecommended:(unint64_t)a3
{
  self->_driverTDrecommended = a3;
}

- (void)setDriverRoamRecommended:(unint64_t)a3
{
  self->_driverRoamRecommended = a3;
}

- (void)setChanQualScore:(unint64_t)a3
{
  self->_chanQualScore = a3;
}

- (WiFiUsageLQMUserSample)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)WiFiUsageLQMUserSample;
    v5 = [(WiFiUsageLQMUserSample *)&v13 init];
    uint64_t v6 = [v4 copy];
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    v5->_rssi = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise = 0x7FFFFFFFFFFFFFFFLL;
    v5->_snr = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssicore1_rssicore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noisecore1_noisecore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_selfCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_otherCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_interference = 0x7FFFFFFFFFFFFFFFLL;
    v5->_totalReportedCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_beaconPer = 0x7FFFFFFFFFFFFFFFLL;
    v5->_decodingAttempts = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_linkTheoreticalMaxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRTS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txMpduDensity = 0x7FFFFFFFFFFFFFFFLL;
    v5->_chanQualScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyP95 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverRoamRecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverTDrecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_trafficState = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isBSPActive = 0;
    v5->_bspTimeToTST = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isScanActiveBSP = 0;
    v5->_isP2PActiveBSP = 0;
    v5->_bspTriggerCount = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMutePercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspAvgMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspErrorPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspTimeOutPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspRejectOrFailPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxConsecutiveFails = 0x7FFFFFFFFFFFFFFFLL;
    mloSamples = v5->_mloSamples;
    v5->_mloSamples = 0;

    self = v5;
    v11 = self;
  }
  else
  {
    NSLog(&cfstr_SInvalidInterf.isa, "-[WiFiUsageLQMUserSample initWithInterfaceName:]", 0);
    v11 = 0;
  }

  return v11;
}

- (BOOL)isBspSampleDurationExpected:(unint64_t)a3
{
  unint64_t v4 = [(WiFiUsageLQMUserSample *)self duration];
  unint64_t v5 = 1000 * v4 - a3;
  if (1000 * v4 < a3) {
    unint64_t v5 = a3 - 1000 * v4;
  }
  if (a3) {
    BOOL v6 = v5 >= 20000 * v4 / 0x64;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (void)populateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 BspMaxConsecutiveFails:(unint64_t)a16
{
  BOOL v16 = a8;
  BOOL v17 = a7;
  BOOL v20 = a4;
  [(WiFiUsageLQMUserSample *)self setIsBSPActive:a4];
  if (v20 && !a3 && [(WiFiUsageLQMUserSample *)self isBspSampleDurationExpected:a6])
  {
    [(WiFiUsageLQMUserSample *)self setBspTimeToTST:a5];
    [(WiFiUsageLQMUserSample *)self setIsScanActiveBSP:v17];
    [(WiFiUsageLQMUserSample *)self setIsP2PActiveBSP:v16];
    [(WiFiUsageLQMUserSample *)self setBspTriggerCount:a9];
    [(WiFiUsageLQMUserSample *)self setBspMutePercentage:a10];
    [(WiFiUsageLQMUserSample *)self setBspMaxMuteMS:a11];
    [(WiFiUsageLQMUserSample *)self setBspAvgMuteMS:a12];
    [(WiFiUsageLQMUserSample *)self setBspErrorPercentage:a13];
    [(WiFiUsageLQMUserSample *)self setBspTimeOutPercentageOfTriggers:a14];
    [(WiFiUsageLQMUserSample *)self setBspRejectOrFailPercentageOfTriggers:a15];
    [(WiFiUsageLQMUserSample *)self setBspMaxConsecutiveFails:a16];
  }
}

- (void)populateWithPerMLOLinkStats:(apple_mlo_link_lqm *)a3
{
  unint64_t v5 = [WiFiUsageLQMMLOSample alloc];
  unint64_t duration = self->_duration;
  long long v7 = *(_OWORD *)&a3->var4;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v7;
  uint64_t v13 = *(void *)&a3->var8;
  uint64_t v8 = [(WiFiUsageLQMMLOSample *)v5 initWith:v12 andDuration:duration];
  if (v8)
  {
    mloSamples = self->_mloSamples;
    if (!mloSamples)
    {
      v10 = (NSMutableArray *)objc_opt_new();
      v11 = self->_mloSamples;
      self->_mloSamples = v10;

      mloSamples = self->_mloSamples;
    }
    [(NSMutableArray *)mloSamples addObject:v8];
  }
}

- (int64_t)rssiForTD
{
  unint64_t perCoreRssiInUse = self->_perCoreRssiInUse;
  if (perCoreRssiInUse > 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.isa + *off_1E69BD698[perCoreRssiInUse]);
  }
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  networkDetails = self->_networkDetails;
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMUserSample;
  unint64_t v4 = [(WiFiUsageLQMSample *)&v8 description];
  unint64_t v5 = [v2 stringWithFormat:@"%@{%@}", networkDetails, v4];

  BOOL v6 = [NSString stringWithString:v5];

  return v6;
}

- (void)appendNetworkDetailsToDict:(id)a3
{
  networkDetails = self->_networkDetails;
  id v5 = a3;
  BOOL v6 = +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:networkDetails];
  [v5 addEntriesFromDictionary:v6];

  long long v7 = [(WiFiUsageNetworkDetails *)self->_networkDetails bssEnvironment];
  [v5 setObject:v7 forKeyedSubscript:@"bssEnvironment"];

  objc_super v8 = objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageNetworkDetails isPersonalHotspot](self->_networkDetails, "isPersonalHotspot"));
  [v5 setObject:v8 forKeyedSubscript:@"isPersonalHotspot"];

  objc_msgSend(NSNumber, "numberWithBool:", -[WiFiUsageNetworkDetails hasEnterpriseSecurity](self->_networkDetails, "hasEnterpriseSecurity"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:@"isEnterprise"];
}

- (void)appendBSSDetailsToDict:(id)a3
{
  id v17 = a3;
  unint64_t v4 = +[WiFiUsagePrivacyFilter bandAsString:[(WiFiUsageBssDetails *)self->_bssDetails band]];
  [v17 setObject:v4 forKeyedSubscript:@"band"];

  id v5 = +[WiFiUsagePrivacyFilter subBandForBSPAsStringFromChannel:[(WiFiUsageBssDetails *)self->_bssDetails channel] andBand:[(WiFiUsageBssDetails *)self->_bssDetails band]];
  [v17 setObject:v5 forKeyedSubscript:@"bandForBSP"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[WiFiUsageBssDetails channel](self->_bssDetails, "channel"));
  long long v7 = [v6 stringValue];
  [v17 setObject:v7 forKeyedSubscript:@"channel"];

  objc_super v8 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"));
  id v9 = [v8 stringValue];
  [v17 setObject:v9 forKeyedSubscript:@"channelWidth"];

  v10 = [(WiFiUsageBssDetails *)self->_bssDetails apProfile];
  [v17 setObject:v10 forKeyedSubscript:@"apProfile"];

  bssDetails = self->_bssDetails;
  if (bssDetails)
  {
    v12 = [(WiFiUsageBssDetails *)bssDetails currentMloLinks];
    uint64_t v13 = [v12 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    v14 = [v13 componentsJoinedByString:@"|"];
    [v17 setObject:v14 forKeyedSubscript:@"MLOConfiguration"];

    v15 = [(WiFiUsageBssDetails *)self->_bssDetails mloTrafficSwitchEnabled];
    [v17 setObject:v15 forKeyedSubscript:@"isMloTrafficSwitchEnabled"];

    BOOL v16 = +[WiFiUsagePrivacyFilter bandAsString:[(WiFiUsageBssDetails *)self->_bssDetails currentMloPreferredBand]];
    [v17 setObject:v16 forKeyedSubscript:@"mloPreferredBand"];
  }
}

- (id)asDictionaryInto:(id)a3
{
  id v4 = a3;
  [(WiFiUsageLQMUserSample *)self appendBSSDetailsToDict:v4];
  [(WiFiUsageLQMUserSample *)self appendNetworkDetailsToDict:v4];
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageLQMUserSample;
  id v5 = [(WiFiUsageLQMSample *)&v7 asDictionaryInto:v4];

  return v5;
}

+ (id)allLQMProperties
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMUserSample;
  v3 = objc_msgSendSuper2(&v7, sel_allLQMProperties);
  id v4 = [v2 setWithSet:v3];

  [v4 addObject:@"fgApp"];
  id v5 = (void *)[v4 copy];

  return v5;
}

+ (id)featureFromFieldName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", @"chanQualScore", @"minimum", @"txLatencyScore", @"minimum", @"rxLatencyScore", @"minimum", @"txLossScore", @"minimum", @"rxLossScore", @"maximum", @"txLatencyP95", @"maximum", @"isAnyAppInFG", @"maximum", @"isFTactive", @"maximum", @"isTimeSensitiveAppRunning",
    @"mode",
    @"driverRoamRecommended",
    @"mode",
    @"driverTDrecommended",
    @"mode",
    @"trafficState",
    @"mode",
    @"duration",
  id v5 = 0);
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = @"median";
  }

  return v7;
}

- (NSString)motionState
{
  return self->_motionState;
}

- (BOOL)isAnyAppInFG
{
  return self->_isAnyAppInFG;
}

- (BOOL)isFTactive
{
  return self->_isFTactive;
}

- (BOOL)isTimeSensitiveAppRunning
{
  return self->_isTimeSensitiveAppRunning;
}

- (void)setTimestamp:(id)a3
{
}

- (void)setRssi_core0:(int64_t)a3
{
  self->_rssi_core0 = a3;
}

- (void)setRssi_core1:(int64_t)a3
{
  self->_rssi_core1 = a3;
}

- (int64_t)diff_rssi_core0
{
  return self->_diff_rssi_core0;
}

- (void)setDiff_rssi_core0:(int64_t)a3
{
  self->_diff_rssi_core0 = a3;
}

- (int64_t)diff_rssi_core1
{
  return self->_diff_rssi_core1;
}

- (void)setDiff_rssi_core1:(int64_t)a3
{
  self->_diff_rssi_core1 = a3;
}

- (int64_t)diff_rssicore1_rssicore0
{
  return self->_diff_rssicore1_rssicore0;
}

- (void)setDiff_rssicore1_rssicore0:(int64_t)a3
{
  self->_diff_rssicore1_rssicore0 = a3;
}

- (unint64_t)perCoreRssiInUse
{
  return self->_perCoreRssiInUse;
}

- (void)setPerCoreRssiInUse:(unint64_t)a3
{
  self->_unint64_t perCoreRssiInUse = a3;
}

- (int64_t)noise_core0
{
  return self->_noise_core0;
}

- (void)setNoise_core0:(int64_t)a3
{
  self->_noise_core0 = a3;
}

- (int64_t)noise_core1
{
  return self->_noise_core1;
}

- (void)setNoise_core1:(int64_t)a3
{
  self->_noise_core1 = a3;
}

- (int64_t)diff_noise_core0
{
  return self->_diff_noise_core0;
}

- (void)setDiff_noise_core0:(int64_t)a3
{
  self->_diff_noise_core0 = a3;
}

- (int64_t)diff_noise_core1
{
  return self->_diff_noise_core1;
}

- (void)setDiff_noise_core1:(int64_t)a3
{
  self->_diff_noise_core1 = a3;
}

- (int64_t)diff_noisecore1_noisecore0
{
  return self->_diff_noisecore1_noisecore0;
}

- (void)setDiff_noisecore1_noisecore0:(int64_t)a3
{
  self->_diff_noisecore1_noisecore0 = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)txBytesSecondary
{
  return self->_txBytesSecondary;
}

- (unint64_t)rxBytesSecondary
{
  return self->_rxBytesSecondary;
}

- (unint64_t)rxL3Packets
{
  return self->_rxL3Packets;
}

- (unint64_t)txBytesOverTxL3Packets
{
  return self->_txBytesOverTxL3Packets;
}

- (unint64_t)rxBytesOverRxL3Packets
{
  return self->_rxBytesOverRxL3Packets;
}

- (unint64_t)linkTheoreticalMaxRate
{
  return self->_linkTheoreticalMaxRate;
}

- (void)setLinkTheoreticalMaxRate:(unint64_t)a3
{
  self->_linkTheoreticalMaxRate = a3;
}

- (unint64_t)txRateOverLinkTheoreticalMaxPercentage
{
  return self->_txRateOverLinkTheoreticalMaxPercentage;
}

- (void)setTxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverLinkTheoreticalMaxPercentage = a3;
}

- (unint64_t)rxRateOverLinkTheoreticalMaxPercentage
{
  return self->_rxRateOverLinkTheoreticalMaxPercentage;
}

- (void)setRxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverLinkTheoreticalMaxPercentage = a3;
}

- (void)setTxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (void)setRxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (unint64_t)txRTS
{
  return self->_txRTS;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (unint64_t)txMpduDensity
{
  return self->_txMpduDensity;
}

- (unint64_t)chanQualScore
{
  return self->_chanQualScore;
}

- (unint64_t)txLatencyScore
{
  return self->_txLatencyScore;
}

- (unint64_t)rxLatencyScore
{
  return self->_rxLatencyScore;
}

- (unint64_t)txLossScore
{
  return self->_txLossScore;
}

- (unint64_t)rxLossScore
{
  return self->_rxLossScore;
}

- (unint64_t)txLatencyP95
{
  return self->_txLatencyP95;
}

- (unint64_t)driverRoamRecommended
{
  return self->_driverRoamRecommended;
}

- (unint64_t)trafficState
{
  return self->_trafficState;
}

- (NSMutableArray)mloSamples
{
  return self->_mloSamples;
}

- (void)setMloSamples:(id)a3
{
}

- (BOOL)isBSPActive
{
  return self->_isBSPActive;
}

- (void)setIsBSPActive:(BOOL)a3
{
  self->_isBSPActive = a3;
}

- (unint64_t)bspTimeToTST
{
  return self->_bspTimeToTST;
}

- (void)setBspTimeToTST:(unint64_t)a3
{
  self->_bspTimeToTST = a3;
}

- (BOOL)isScanActiveBSP
{
  return self->_isScanActiveBSP;
}

- (void)setIsScanActiveBSP:(BOOL)a3
{
  self->_isScanActiveBSP = a3;
}

- (BOOL)isP2PActiveBSP
{
  return self->_isP2PActiveBSP;
}

- (void)setIsP2PActiveBSP:(BOOL)a3
{
  self->_isP2PActiveBSP = a3;
}

- (unint64_t)bspTriggerCount
{
  return self->_bspTriggerCount;
}

- (void)setBspTriggerCount:(unint64_t)a3
{
  self->_bspTriggerCount = a3;
}

- (unint64_t)bspMutePercentage
{
  return self->_bspMutePercentage;
}

- (void)setBspMutePercentage:(unint64_t)a3
{
  self->_bspMutePercentage = a3;
}

- (unint64_t)bspMaxMuteMS
{
  return self->_bspMaxMuteMS;
}

- (void)setBspMaxMuteMS:(unint64_t)a3
{
  self->_bspMaxMuteMS = a3;
}

- (unint64_t)bspAvgMuteMS
{
  return self->_bspAvgMuteMS;
}

- (void)setBspAvgMuteMS:(unint64_t)a3
{
  self->_bspAvgMuteMS = a3;
}

- (unint64_t)bspErrorPercentage
{
  return self->_bspErrorPercentage;
}

- (void)setBspErrorPercentage:(unint64_t)a3
{
  self->_bspErrorPercentage = a3;
}

- (unint64_t)bspTimeOutPercentageOfTriggers
{
  return self->_bspTimeOutPercentageOfTriggers;
}

- (void)setBspTimeOutPercentageOfTriggers:(unint64_t)a3
{
  self->_bspTimeOutPercentageOfTriggers = a3;
}

- (unint64_t)bspRejectOrFailPercentageOfTriggers
{
  return self->_bspRejectOrFailPercentageOfTriggers;
}

- (void)setBspRejectOrFailPercentageOfTriggers:(unint64_t)a3
{
  self->_bspRejectOrFailPercentageOfTriggers = a3;
}

- (unint64_t)bspMaxConsecutiveFails
{
  return self->_bspMaxConsecutiveFails;
}

- (void)setBspMaxConsecutiveFails:(unint64_t)a3
{
  self->_bspMaxConsecutiveFails = a3;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (WiFiUsageBssDetails)bssDetails
{
  return self->_bssDetails;
}

@end