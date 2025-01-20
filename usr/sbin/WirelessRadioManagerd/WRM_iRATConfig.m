@interface WRM_iRATConfig
- (BOOL)btMetricsEnabled;
- (BOOL)cellularMetricsEnabled;
- (BOOL)handoverAlgorithmSettingDynamic;
- (BOOL)idsMetricsEnabled;
- (BOOL)mobilityStateAwarenessEnabled;
- (BOOL)p2pAssistanceEnabled;
- (BOOL)qmiClientEnabled;
- (BOOL)rtpMetricsEnabled;
- (BOOL)symtompsMetricsEnabled;
- (BOOL)wifiMetricsEnabled;
- (WRM_iRATConfig)init;
- (int64_t)cbrsEnterRsrpMin;
- (int64_t)cbrsEnterRsrpOffset;
- (int64_t)cbrsEnterRsrqMin;
- (int64_t)cbrsEnterRsrqOffset;
- (int64_t)cbrsExitRsrpMin;
- (int64_t)cbrsExitRsrpOffset;
- (int64_t)cbrsExitRsrqMin;
- (int64_t)cbrsExitRsrqOffset;
- (int64_t)cellularStickinessThreaholdActive;
- (int64_t)cellularStickinessThreaholdIdle;
- (int64_t)cellularStickinessThreaholdStationary;
- (int64_t)cellularStickinessThreaholdStationaryActive;
- (int64_t)commCenterAppDebouncingTimer;
- (int64_t)commCenterBTlpmThreasholdBTProximity;
- (int64_t)commCenterBreadCrumProcTimer;
- (int64_t)commCenterPeriodicBreadCrumTimer;
- (int64_t)commCenterStickinessThreasholdNotinWiFiProximity;
- (int64_t)commCenterStickinessThreasholdWiFiProximity;
- (int64_t)commCenterThumperStickinessThreasholdNotinBTProximity;
- (int64_t)ctServiceType;
- (int64_t)dataBtMovingAvgAlphaDenum;
- (int64_t)dataBtStickinessTimeThreshMs;
- (int64_t)dataMinBtRssiTh0;
- (int64_t)dataMinBtRssiTh1;
- (int64_t)dataMinBtRxPerTh0;
- (int64_t)dataMinBtRxPerTh1;
- (int64_t)dataMinBtTxPerTh0;
- (int64_t)dataMinBtTxPerTh1;
- (int64_t)dataMinWifiBeaconPerTh0;
- (int64_t)dataMinWifiRssiTh0;
- (int64_t)dataMinWifiRssiTh1;
- (int64_t)dataMinWifiSnrTh0;
- (int64_t)dataMinWifiSnrTh1;
- (int64_t)dataWifiMinBeaconCount;
- (int64_t)faceTimeAleratedModeCCATh0;
- (int64_t)faceTimeAleratedModeCCATh1;
- (int64_t)faceTimeAleratedModeRssiTh0;
- (int64_t)faceTimeAleratedModeRssiTh1;
- (int64_t)faceTimeAleratedModeStationCount;
- (int64_t)faceTimeAleratedModeTxPer0;
- (int64_t)faceTimeAleratedModeTxPer1;
- (int64_t)faceTimeAleratedModeVideoErasures;
- (int64_t)faceTimeCellularStickinessThreaholdActive;
- (int64_t)faceTimeEnhancedVideoMetricsEnabled;
- (int64_t)faceTimeHandoverAvgRxPktLossThreshold;
- (int64_t)faceTimeHandoverRxPktLossThreshold;
- (int64_t)faceTimeMinActiveWiFiAvgTxPktLossRateTh;
- (int64_t)faceTimeMinActiveWiFiRssiTh0;
- (int64_t)faceTimeMinActiveWiFiRssiTh1;
- (int64_t)faceTimeMovingAverageWindow;
- (int64_t)faceTimeVideoPacketLoss;
- (int64_t)handoverAlgorithmType;
- (int64_t)handoverAvgIdleRxPktLossThreshold;
- (int64_t)handoverAvgRxPktLossThreshold;
- (int64_t)handoverNominalJitterBufferThreshold;
- (int64_t)handoverRTThreshold;
- (int64_t)handoverRxJitterThreshold;
- (int64_t)handoverRxPktLossThreshold;
- (int64_t)handoverTxPktLossThreshold;
- (int64_t)historicalAgeOfConnectedLinkInDays;
- (int64_t)idsAvgWiFiMinPerTh1;
- (int64_t)idsBTMinPerTh1;
- (int64_t)idsBTMinRttTh1;
- (int64_t)idsMinAvgWiFiTxPktLossRateTh0;
- (int64_t)idsMinAvgWiFiTxPktLossRateTh1;
- (int64_t)idsMinWiFiEffectivePhyRateTh0;
- (int64_t)idsMinWiFiEffectivePhyRateTh1;
- (int64_t)idsMinWiFiRssiTh0;
- (int64_t)idsMinWiFiRssiTh1;
- (int64_t)idsMinWiFiSnrTh0;
- (int64_t)idsMinWiFiSnrTh1;
- (int64_t)idsMinWiFiThroughputTh0;
- (int64_t)idsMinWiFiThroughputTh1;
- (int64_t)idsMovAvgWiFiMinPerTh1;
- (int64_t)idsPeriodicReportInterval;
- (int64_t)idsWiFiMinPerTh1;
- (int64_t)idsWiFiMinRttTh1;
- (int64_t)minActiveWiFiAvgTxPktLossRateTh;
- (int64_t)minActiveWiFiCcaTh0;
- (int64_t)minActiveWiFiCcaTh1;
- (int64_t)minActiveWiFiRssiTh0;
- (int64_t)minActiveWiFiRssiTh1;
- (int64_t)minActiveWiFiSnrTh0;
- (int64_t)minActiveWiFiSnrTh1;
- (int64_t)minActiveWiFiTxPktLossRateTh0;
- (int64_t)minActiveWiFiTxPktLossRateTh1;
- (int64_t)minIdleWiFiCcaTh0;
- (int64_t)minIdleWiFiCcaTh1;
- (int64_t)minIdleWiFiFwTxPktLossRateTh0;
- (int64_t)minIdleWiFiFwTxPktLossRateTh1;
- (int64_t)minIdleWiFiRssiTh0;
- (int64_t)minIdleWiFiRssiTh1;
- (int64_t)minIdleWiFiSnrTh0;
- (int64_t)minIdleWiFiSnrTh1;
- (int64_t)minIdleWiFiTxPktLossRateTh0;
- (int64_t)minIdleWiFiTxPktLossRateTh1;
- (int64_t)minMovSigBarTh0;
- (int64_t)minSigBarTh0;
- (int64_t)minSigBarTh1;
- (int64_t)minSigBarTh2;
- (int64_t)minWiFiBeaconPerTh0;
- (int64_t)minWiFiBeaconPerTh1;
- (int64_t)nonCbrsEnterRsrpMin;
- (int64_t)nonCbrsEnterRsrqMin;
- (int64_t)nonCbrsExitRsrpMin;
- (int64_t)nonCbrsExitRsrqMin;
- (int64_t)periodicReportInterval;
- (int64_t)pingPongAvoidanceThresholdRunning;
- (int64_t)pingPongAvoidanceThresholdStationary;
- (int64_t)pingPongAvoidanceThresholdWalking;
- (int64_t)rssiHysterisisRunning;
- (int64_t)rssiHysterisisWalking;
- (int64_t)snrHysterisisRunning;
- (int64_t)snrHysterisisWalking;
- (int64_t)sosWaypointRSRPTh;
- (int64_t)tcpActiveConnSuccessThreshold;
- (int64_t)tcpIdleConnSuccessThreshold;
- (int64_t)tcpJitterThreshold;
- (int64_t)tcpRttThreshold;
- (int64_t)transportMetricsRateLimitingThreshold;
- (void)dealloc;
- (void)loadDefaultsParam;
- (void)loadiRATConfigurablePolicy;
- (void)printiRATConfig;
- (void)revertFaceTimeThToAzul;
- (void)setBtMetricsEnabled:(BOOL)a3;
- (void)setCbrsEnterRsrpMin:(int64_t)a3;
- (void)setCbrsEnterRsrpOffset:(int64_t)a3;
- (void)setCbrsEnterRsrqMin:(int64_t)a3;
- (void)setCbrsEnterRsrqOffset:(int64_t)a3;
- (void)setCbrsExitRsrpMin:(int64_t)a3;
- (void)setCbrsExitRsrpOffset:(int64_t)a3;
- (void)setCbrsExitRsrqMin:(int64_t)a3;
- (void)setCbrsExitRsrqOffset:(int64_t)a3;
- (void)setCellularMetricsEnabled:(BOOL)a3;
- (void)setCellularStickinessThreaholdActive:(int64_t)a3;
- (void)setCellularStickinessThreaholdIdle:(int64_t)a3;
- (void)setCellularStickinessThreaholdStationary:(int64_t)a3;
- (void)setCellularStickinessThreaholdStationaryActive:(int64_t)a3;
- (void)setCommCenterAppDebouncingTimer:(int64_t)a3;
- (void)setCommCenterBTlpmThreasholdBTProximity:(int64_t)a3;
- (void)setCommCenterBreadCrumProcTimer:(int64_t)a3;
- (void)setCommCenterPeriodicBreadCrumTimer:(int64_t)a3;
- (void)setCommCenterStickinessThreasholdNotinWiFiProximity:(int64_t)a3;
- (void)setCommCenterStickinessThreasholdWiFiProximity:(int64_t)a3;
- (void)setCommCenterThumperStickinessThreasholdNotinBTProximity:(int64_t)a3;
- (void)setCtServiceType:(int64_t)a3;
- (void)setDataBtMovingAvgAlphaDenum:(int64_t)a3;
- (void)setDataBtStickinessTimeThreshMs:(int64_t)a3;
- (void)setDataMinBtRssiTh0:(int64_t)a3;
- (void)setDataMinBtRssiTh1:(int64_t)a3;
- (void)setDataMinBtRxPerTh0:(int64_t)a3;
- (void)setDataMinBtRxPerTh1:(int64_t)a3;
- (void)setDataMinBtTxPerTh0:(int64_t)a3;
- (void)setDataMinBtTxPerTh1:(int64_t)a3;
- (void)setDataMinWifiBeaconPerTh0:(int64_t)a3;
- (void)setDataMinWifiRssiTh0:(int64_t)a3;
- (void)setDataMinWifiRssiTh1:(int64_t)a3;
- (void)setDataMinWifiSnrTh0:(int64_t)a3;
- (void)setDataMinWifiSnrTh1:(int64_t)a3;
- (void)setDataWifiMinBeaconCount:(int64_t)a3;
- (void)setFaceTimeAleratedModeCCATh0:(int64_t)a3;
- (void)setFaceTimeAleratedModeCCATh1:(int64_t)a3;
- (void)setFaceTimeAleratedModeRssiTh0:(int64_t)a3;
- (void)setFaceTimeAleratedModeRssiTh1:(int64_t)a3;
- (void)setFaceTimeAleratedModeStationCount:(int64_t)a3;
- (void)setFaceTimeAleratedModeTxPer0:(int64_t)a3;
- (void)setFaceTimeAleratedModeTxPer1:(int64_t)a3;
- (void)setFaceTimeAleratedModeVideoErasures:(int64_t)a3;
- (void)setFaceTimeCellularStickinessThreaholdActive:(int64_t)a3;
- (void)setFaceTimeEnhancedVideoMetricsEnabled:(int64_t)a3;
- (void)setFaceTimeHandoverAvgRxPktLossThreshold:(int64_t)a3;
- (void)setFaceTimeHandoverRxPktLossThreshold:(int64_t)a3;
- (void)setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3;
- (void)setFaceTimeMinActiveWiFiRssiTh0:(int64_t)a3;
- (void)setFaceTimeMinActiveWiFiRssiTh1:(int64_t)a3;
- (void)setFaceTimeMovingAverageWindow:(int64_t)a3;
- (void)setFaceTimeVideoPacketLoss:(int64_t)a3;
- (void)setHandoverAlgorithmSettingDynamic:(BOOL)a3;
- (void)setHandoverAlgorithmType:(int64_t)a3;
- (void)setHandoverAvgIdleRxPktLossThreshold:(int64_t)a3;
- (void)setHandoverAvgRxPktLossThreshold:(int64_t)a3;
- (void)setHandoverNominalJitterBufferThreshold:(int64_t)a3;
- (void)setHandoverRTThreshold:(int64_t)a3;
- (void)setHandoverRxJitterThreshold:(int64_t)a3;
- (void)setHandoverRxPktLossThreshold:(int64_t)a3;
- (void)setHandoverTxPktLossThreshold:(int64_t)a3;
- (void)setHistoricalAgeOfConnectedLinkInDays:(int64_t)a3;
- (void)setIdsAvgWiFiMinPerTh1:(int64_t)a3;
- (void)setIdsBTMinPerTh1:(int64_t)a3;
- (void)setIdsBTMinRttTh1:(int64_t)a3;
- (void)setIdsMetricsEnabled:(BOOL)a3;
- (void)setIdsMinAvgWiFiTxPktLossRateTh0:(int64_t)a3;
- (void)setIdsMinAvgWiFiTxPktLossRateTh1:(int64_t)a3;
- (void)setIdsMinWiFiEffectivePhyRateTh0:(int64_t)a3;
- (void)setIdsMinWiFiEffectivePhyRateTh1:(int64_t)a3;
- (void)setIdsMinWiFiRssiTh0:(int64_t)a3;
- (void)setIdsMinWiFiRssiTh1:(int64_t)a3;
- (void)setIdsMinWiFiSnrTh0:(int64_t)a3;
- (void)setIdsMinWiFiSnrTh1:(int64_t)a3;
- (void)setIdsMinWiFiThroughputTh0:(int64_t)a3;
- (void)setIdsMinWiFiThroughputTh1:(int64_t)a3;
- (void)setIdsMovAvgWiFiMinPerTh1:(int64_t)a3;
- (void)setIdsPeriodicReportInterval:(int64_t)a3;
- (void)setIdsWiFiMinPerTh1:(int64_t)a3;
- (void)setIdsWiFiMinRttTh1:(int64_t)a3;
- (void)setMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3;
- (void)setMinActiveWiFiCcaTh0:(int64_t)a3;
- (void)setMinActiveWiFiCcaTh1:(int64_t)a3;
- (void)setMinActiveWiFiRssiTh0:(int64_t)a3;
- (void)setMinActiveWiFiRssiTh1:(int64_t)a3;
- (void)setMinActiveWiFiSnrTh0:(int64_t)a3;
- (void)setMinActiveWiFiSnrTh1:(int64_t)a3;
- (void)setMinActiveWiFiTxPktLossRateTh0:(int64_t)a3;
- (void)setMinActiveWiFiTxPktLossRateTh1:(int64_t)a3;
- (void)setMinIdleWiFiCcaTh0:(int64_t)a3;
- (void)setMinIdleWiFiCcaTh1:(int64_t)a3;
- (void)setMinIdleWiFiFwTxPktLossRateTh0:(int64_t)a3;
- (void)setMinIdleWiFiFwTxPktLossRateTh1:(int64_t)a3;
- (void)setMinIdleWiFiRssiTh0:(int64_t)a3;
- (void)setMinIdleWiFiRssiTh1:(int64_t)a3;
- (void)setMinIdleWiFiSnrTh0:(int64_t)a3;
- (void)setMinIdleWiFiSnrTh1:(int64_t)a3;
- (void)setMinIdleWiFiTxPktLossRateTh0:(int64_t)a3;
- (void)setMinIdleWiFiTxPktLossRateTh1:(int64_t)a3;
- (void)setMinMovSigBarTh0:(int64_t)a3;
- (void)setMinSigBarTh0:(int64_t)a3;
- (void)setMinSigBarTh1:(int64_t)a3;
- (void)setMinSigBarTh2:(int64_t)a3;
- (void)setMinWiFiBeaconPerTh0:(int64_t)a3;
- (void)setMinWiFiBeaconPerTh1:(int64_t)a3;
- (void)setMobilityStateAwarenessEnabled:(BOOL)a3;
- (void)setNonCbrsEnterRsrpMin:(int64_t)a3;
- (void)setNonCbrsEnterRsrqMin:(int64_t)a3;
- (void)setNonCbrsExitRsrpMin:(int64_t)a3;
- (void)setNonCbrsExitRsrqMin:(int64_t)a3;
- (void)setP2pAssistanceEnabled:(BOOL)a3;
- (void)setPeriodicReportInterval:(int64_t)a3;
- (void)setPingPongAvoidanceThresholdRunning:(int64_t)a3;
- (void)setPingPongAvoidanceThresholdStationary:(int64_t)a3;
- (void)setPingPongAvoidanceThresholdWalking:(int64_t)a3;
- (void)setQmiClientEnabled:(BOOL)a3;
- (void)setRssiHysterisisRunning:(int64_t)a3;
- (void)setRssiHysterisisWalking:(int64_t)a3;
- (void)setRtpMetricsEnabled:(BOOL)a3;
- (void)setSnrHysterisisRunning:(int64_t)a3;
- (void)setSnrHysterisisWalking:(int64_t)a3;
- (void)setSosWaypointRSRPTh:(int64_t)a3;
- (void)setSymtompsMetricsEnabled:(BOOL)a3;
- (void)setTcpActiveConnSuccessThreshold:(int64_t)a3;
- (void)setTcpIdleConnSuccessThreshold:(int64_t)a3;
- (void)setTcpJitterThreshold:(int64_t)a3;
- (void)setTcpRttThreshold:(int64_t)a3;
- (void)setTransportMetricsRateLimitingThreshold:(int64_t)a3;
- (void)setWifiMetricsEnabled:(BOOL)a3;
- (void)updateFaceTimeRSSITh:(int64_t)a3;
@end

@implementation WRM_iRATConfig

- (BOOL)symtompsMetricsEnabled
{
  return self->_symtompsMetricsEnabled;
}

- (int64_t)minIdleWiFiCcaTh1
{
  return self->_minIdleWiFiCcaTh1;
}

- (int64_t)minWiFiBeaconPerTh1
{
  return self->_minWiFiBeaconPerTh1;
}

- (int64_t)ctServiceType
{
  return self->_ctServiceType;
}

- (int64_t)pingPongAvoidanceThresholdStationary
{
  return self->_pingPongAvoidanceThresholdStationary;
}

- (int64_t)minMovSigBarTh0
{
  return self->_minMovSigBarTh0;
}

- (int64_t)minIdleWiFiSnrTh1
{
  return self->_minIdleWiFiSnrTh1;
}

- (int64_t)minIdleWiFiRssiTh1
{
  return self->_minIdleWiFiRssiTh1;
}

- (int64_t)dataWifiMinBeaconCount
{
  return self->_dataWifiMinBeaconCount;
}

- (WRM_iRATConfig)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATConfig;
  v2 = [(WRM_iRATConfig *)&v4 init];
  [(WRM_iRATConfig *)v2 loadDefaultsParam];
  [(WRM_iRATConfig *)v2 loadiRATConfigurablePolicy];
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_iRATConfig;
  [(WRM_iRATConfig *)&v2 dealloc];
}

- (void)loadDefaultsParam
{
  [(WRM_iRATConfig *)self setHandoverAlgorithmType:0];
  [(WRM_iRATConfig *)self setCtServiceType:0];
  [(WRM_iRATConfig *)self setHandoverAlgorithmSettingDynamic:1];
  [(WRM_iRATConfig *)self setPingPongAvoidanceThresholdStationary:5000];
  [(WRM_iRATConfig *)self setPingPongAvoidanceThresholdWalking:1000];
  [(WRM_iRATConfig *)self setPingPongAvoidanceThresholdRunning:200];
  [(WRM_iRATConfig *)self setCellularStickinessThreaholdIdle:5000];
  [(WRM_iRATConfig *)self setCellularStickinessThreaholdActive:5000];
  [(WRM_iRATConfig *)self setCellularStickinessThreaholdStationary:5000];
  [(WRM_iRATConfig *)self setCellularStickinessThreaholdStationaryActive:5000];
  [(WRM_iRATConfig *)self setRtpMetricsEnabled:1];
  [(WRM_iRATConfig *)self setWifiMetricsEnabled:1];
  [(WRM_iRATConfig *)self setCellularMetricsEnabled:1];
  [(WRM_iRATConfig *)self setSymtompsMetricsEnabled:1];
  [(WRM_iRATConfig *)self setIdsMetricsEnabled:1];
  [(WRM_iRATConfig *)self setP2pAssistanceEnabled:0];
  [(WRM_iRATConfig *)self setBtMetricsEnabled:1];
  [(WRM_iRATConfig *)self setMobilityStateAwarenessEnabled:1];
  [(WRM_iRATConfig *)self setQmiClientEnabled:1];
  [(WRM_iRATConfig *)self setPeriodicReportInterval:40];
  [(WRM_iRATConfig *)self setHandoverRTThreshold:300];
  [(WRM_iRATConfig *)self setHandoverRxJitterThreshold:200];
  [(WRM_iRATConfig *)self setHandoverRxPktLossThreshold:2];
  [(WRM_iRATConfig *)self setHandoverAvgRxPktLossThreshold:10];
  [(WRM_iRATConfig *)self setHandoverAvgIdleRxPktLossThreshold:30];
  [(WRM_iRATConfig *)self setHandoverTxPktLossThreshold:2];
  [(WRM_iRATConfig *)self setHandoverNominalJitterBufferThreshold:1000];
  [(WRM_iRATConfig *)self setMinActiveWiFiSnrTh0:16];
  [(WRM_iRATConfig *)self setMinActiveWiFiSnrTh1:16];
  [(WRM_iRATConfig *)self setMinActiveWiFiRssiTh0:-85];
  [(WRM_iRATConfig *)self setMinActiveWiFiRssiTh1:-85];
  [(WRM_iRATConfig *)self setMinActiveWiFiCcaTh0:20];
  [(WRM_iRATConfig *)self setMinActiveWiFiCcaTh1:20];
  [(WRM_iRATConfig *)self setMinIdleWiFiSnrTh0:16];
  [(WRM_iRATConfig *)self setMinIdleWiFiSnrTh1:16];
  [(WRM_iRATConfig *)self setMinIdleWiFiRssiTh0:-85];
  [(WRM_iRATConfig *)self setMinIdleWiFiRssiTh1:-85];
  [(WRM_iRATConfig *)self setMinIdleWiFiCcaTh0:20];
  [(WRM_iRATConfig *)self setMinIdleWiFiCcaTh1:20];
  [(WRM_iRATConfig *)self setIdsMinWiFiRssiTh0:-70];
  [(WRM_iRATConfig *)self setIdsMinWiFiRssiTh1:-80];
  [(WRM_iRATConfig *)self setIdsMinWiFiSnrTh0:15];
  [(WRM_iRATConfig *)self setIdsMinWiFiSnrTh1:5];
  [(WRM_iRATConfig *)self setIdsMinAvgWiFiTxPktLossRateTh0:0];
  [(WRM_iRATConfig *)self setIdsMinAvgWiFiTxPktLossRateTh1:20];
  [(WRM_iRATConfig *)self setIdsMinWiFiThroughputTh0:3];
  [(WRM_iRATConfig *)self setIdsMinWiFiThroughputTh1:1];
  [(WRM_iRATConfig *)self setIdsMinWiFiEffectivePhyRateTh0:12];
  [(WRM_iRATConfig *)self setIdsMinWiFiEffectivePhyRateTh1:6];
  [(WRM_iRATConfig *)self setIdsPeriodicReportInterval:5000];
  [(WRM_iRATConfig *)self setIdsWiFiMinRttTh1:5000];
  [(WRM_iRATConfig *)self setIdsBTMinRttTh1:3000];
  [(WRM_iRATConfig *)self setIdsWiFiMinPerTh1:40];
  [(WRM_iRATConfig *)self setIdsAvgWiFiMinPerTh1:40];
  [(WRM_iRATConfig *)self setIdsMovAvgWiFiMinPerTh1:40];
  [(WRM_iRATConfig *)self setIdsBTMinPerTh1:40];
  [(WRM_iRATConfig *)self setMinActiveWiFiTxPktLossRateTh0:30];
  [(WRM_iRATConfig *)self setMinActiveWiFiTxPktLossRateTh1:30];
  [(WRM_iRATConfig *)self setMinActiveWiFiAvgTxPktLossRateTh:10];
  [(WRM_iRATConfig *)self setMinIdleWiFiTxPktLossRateTh0:30];
  [(WRM_iRATConfig *)self setMinIdleWiFiTxPktLossRateTh1:30];
  [(WRM_iRATConfig *)self setMinIdleWiFiFwTxPktLossRateTh0:30];
  [(WRM_iRATConfig *)self setMinIdleWiFiFwTxPktLossRateTh1:30];
  [(WRM_iRATConfig *)self setMinWiFiBeaconPerTh0:80];
  [(WRM_iRATConfig *)self setMinWiFiBeaconPerTh1:80];
  [(WRM_iRATConfig *)self setSnrHysterisisWalking:3];
  [(WRM_iRATConfig *)self setSnrHysterisisRunning:6];
  [(WRM_iRATConfig *)self setRssiHysterisisWalking:3];
  [(WRM_iRATConfig *)self setRssiHysterisisRunning:6];
  [(WRM_iRATConfig *)self setDataMinBtRssiTh0:-60];
  [(WRM_iRATConfig *)self setDataMinBtRssiTh1:-80];
  [(WRM_iRATConfig *)self setDataBtMovingAvgAlphaDenum:30];
  [(WRM_iRATConfig *)self setDataBtStickinessTimeThreshMs:30000];
  [(WRM_iRATConfig *)self setDataMinWifiRssiTh0:-70];
  [(WRM_iRATConfig *)self setDataMinWifiSnrTh0:10];
  [(WRM_iRATConfig *)self setDataMinWifiRssiTh1:-85];
  [(WRM_iRATConfig *)self setDataMinWifiSnrTh1:5];
  [(WRM_iRATConfig *)self setDataMinWifiBeaconPerTh0:51];
  [(WRM_iRATConfig *)self setDataWifiMinBeaconCount:2];
  [(WRM_iRATConfig *)self setMinSigBarTh0:4];
  [(WRM_iRATConfig *)self setMinMovSigBarTh0:35];
  [(WRM_iRATConfig *)self setMinSigBarTh1:1];
  [(WRM_iRATConfig *)self setMinSigBarTh2:3];
  [(WRM_iRATConfig *)self setSosWaypointRSRPTh:-115];
  [(WRM_iRATConfig *)self setTransportMetricsRateLimitingThreshold:5000];
  [(WRM_iRATConfig *)self setTcpJitterThreshold:100];
  [(WRM_iRATConfig *)self setTcpRttThreshold:200];
  [(WRM_iRATConfig *)self setTcpIdleConnSuccessThreshold:50];
  [(WRM_iRATConfig *)self setTcpActiveConnSuccessThreshold:80];
  [(WRM_iRATConfig *)self setHistoricalAgeOfConnectedLinkInDays:1];
  [(WRM_iRATConfig *)self setFaceTimeCellularStickinessThreaholdActive:20000];
  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:10];
  [(WRM_iRATConfig *)self setFaceTimeHandoverAvgRxPktLossThreshold:10];
  [(WRM_iRATConfig *)self setFaceTimeHandoverRxPktLossThreshold:2];
  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiRssiTh1:-85];
  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiRssiTh0:-70];
  [(WRM_iRATConfig *)self setFaceTimeEnhancedVideoMetricsEnabled:0];
  [(WRM_iRATConfig *)self setFaceTimeMovingAverageWindow:20];
  [(WRM_iRATConfig *)self setFaceTimeVideoPacketLoss:2];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeRssiTh1:-75];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeRssiTh0:-70];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeCCATh1:80];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeCCATh0:70];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeStationCount:15];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeVideoErasures:5];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeTxPer1:15];
  [(WRM_iRATConfig *)self setFaceTimeAleratedModeTxPer0:0];
  [(WRM_iRATConfig *)self setCommCenterStickinessThreasholdWiFiProximity:60000];
  [(WRM_iRATConfig *)self setCommCenterStickinessThreasholdNotinWiFiProximity:20000];
  [(WRM_iRATConfig *)self setCommCenterThumperStickinessThreasholdNotinBTProximity:15000];
  [(WRM_iRATConfig *)self setCommCenterBTlpmThreasholdBTProximity:40];
  [(WRM_iRATConfig *)self setCommCenterAppDebouncingTimer:2];
  [(WRM_iRATConfig *)self setCommCenterPeriodicBreadCrumTimer:58];
  [(WRM_iRATConfig *)self setCommCenterBreadCrumProcTimer:2];
  [(WRM_iRATConfig *)self setCbrsEnterRsrpMin:-111];
  [(WRM_iRATConfig *)self setCbrsEnterRsrqMin:-16];
  [(WRM_iRATConfig *)self setCbrsExitRsrpMin:-119];
  [(WRM_iRATConfig *)self setCbrsExitRsrqMin:-18];
  [(WRM_iRATConfig *)self setNonCbrsEnterRsrpMin:-116];
  [(WRM_iRATConfig *)self setNonCbrsEnterRsrqMin:-18];
  [(WRM_iRATConfig *)self setNonCbrsExitRsrpMin:-119];
  [(WRM_iRATConfig *)self setNonCbrsExitRsrqMin:-30];
  [(WRM_iRATConfig *)self setCbrsEnterRsrpOffset:6];
  [(WRM_iRATConfig *)self setCbrsEnterRsrqOffset:1];
  [(WRM_iRATConfig *)self setCbrsExitRsrpOffset:11];

  [(WRM_iRATConfig *)self setCbrsExitRsrqOffset:1];
}

- (void)printiRATConfig
{
}

- (void)loadiRATConfigurablePolicy
{
  uint64_t v31 = 0;
  +[WCM_Logging logLevel:18 message:@"===== Loading iRAT Configuration Policies"];
  v3 = sub_100095D24(@"WRM_iRAT", @"plist");
  if (v3)
  {
    uint64_t v30 = 0;
    id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:2 format:&v30 error:&v31];
    if (v4)
    {
      id v5 = [v4 objectForKeyedSubscript:@"iRATPolicy"];
      if (v5)
      {
        v6 = v5;
        id v7 = [v5 objectForKeyedSubscript:@"ActivePolicies"];
        if (v7)
        {
          v8 = v7;
          -[WRM_iRATConfig setHandoverAlgorithmType:](self, "setHandoverAlgorithmType:", [objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"HandoverAlgorithmType"), "longLongValue") longLongValue]);
          -[WRM_iRATConfig setHandoverAlgorithmSettingDynamic:](self, "setHandoverAlgorithmSettingDynamic:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"HandoverAlgorithmSettingDynamic"), "BOOLValue"]);
          -[WRM_iRATConfig setPingPongAvoidanceThresholdStationary:](self, "setPingPongAvoidanceThresholdStationary:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"PingPongAvoidanceThresholdStationary"), "longLongValue")]);
          -[WRM_iRATConfig setPingPongAvoidanceThresholdWalking:](self, "setPingPongAvoidanceThresholdWalking:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"PingPongAvoidanceThresholdWalking"), "longLongValue")]);
          -[WRM_iRATConfig setPingPongAvoidanceThresholdRunning:](self, "setPingPongAvoidanceThresholdRunning:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"PingPongAvoidanceThresholdRunning"), "longLongValue")]);
          -[WRM_iRATConfig setCellularStickinessThreaholdIdle:](self, [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"CellularStickinessThreaholdIdle"), "longLongValue"]);
          -[WRM_iRATConfig setCellularStickinessThreaholdActive:](self, "setCellularStickinessThreaholdActive:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"CellularStickinessThreaholdActive"), "longLongValue")]);
          -[WRM_iRATConfig setCellularStickinessThreaholdStationary:](self, "setCellularStickinessThreaholdStationary:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"CellularStickinessThreaholdStationary"), "longLongValue")]);
          -[WRM_iRATConfig setCellularStickinessThreaholdStationaryActive:](self, [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"CellularStickinessThreaholdStationaryActive"), "longLongValue"]);
          -[WRM_iRATConfig setRtpMetricsEnabled:](self, "setRtpMetricsEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"RTPMetricsEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setWifiMetricsEnabled:](self, "setWifiMetricsEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"WiFiMetricsEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setCellularMetricsEnabled:](self, "setCellularMetricsEnabled:", [[objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"CellularMetricsEnabled"), "BOOLValue"] boolValue]);
          -[WRM_iRATConfig setSymtompsMetricsEnabled:](self, "setSymtompsMetricsEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"SymtompsMetricsEnabled"), "BOOLValue")]);
          -[WRM_iRATConfig setP2pAssistanceEnabled:](self, "setP2pAssistanceEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"P2PAssistanceEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setIdsMetricsEnabled:](self, "setIdsMetricsEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"IDSMetricsEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setBtMetricsEnabled:](self, "setBtMetricsEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"BTMetricsEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setMobilityStateAwarenessEnabled:](self, "setMobilityStateAwarenessEnabled:", [objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"MobilityStateAwarenessEnabled"), "BOOLValue"]);
          -[WRM_iRATConfig setQmiClientEnabled:[objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"QMIClientEnabled"), "BOOLValue")];
          id v9 = [v6 objectForKeyedSubscript:@"RTPMetrics"];
          if (v9)
          {
            v10 = v9;
            -[WRM_iRATConfig setPeriodicReportInterval:](self, "setPeriodicReportInterval:", [objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"PeriodicReportInterval"), "longLongValue")]);
            -[WRM_iRATConfig setHandoverRTThreshold:](self, "setHandoverRTThreshold:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverRTThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setHandoverRxJitterThreshold:](self, "setHandoverRxJitterThreshold:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverRxJitterThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setHandoverRxPktLossThreshold:](self, [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverRxPktLossThreshold"), "longLongValue"]);
            -[WRM_iRATConfig setHandoverAvgRxPktLossThreshold:](self, "setHandoverAvgRxPktLossThreshold:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverAvgRxPktLossThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setHandoverAvgIdleRxPktLossThreshold:](self, [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverTotalAvgRxPktLossThreshold"), "longLongValue"]);
            -[WRM_iRATConfig setHandoverTxPktLossThreshold:](self, "setHandoverTxPktLossThreshold:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverTxPktLossThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setHandoverNominalJitterBufferThreshold:](self, "setHandoverNominalJitterBufferThreshold:", [objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"HandoverNominalJitterBufferThreshold"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No RTP metrics config"];
          }
          id v12 = [v6 objectForKeyedSubscript:@"WiFiMetrics"];
          if (v12)
          {
            v13 = v12;
            -[WRM_iRATConfig setMinActiveWiFiSnrTh0:](self, "setMinActiveWiFiSnrTh0:", [objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", @"MinActiveWiFiSnrTh0"), "longLongValue"]);
            -[WRM_iRATConfig setMinActiveWiFiSnrTh1:](self, "setMinActiveWiFiSnrTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiSnrTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiRssiTh0:](self, "setMinActiveWiFiRssiTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiRssiTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiRssiTh1:](self, "setMinActiveWiFiRssiTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiRssiTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiSnrTh0:](self, "setMinIdleWiFiSnrTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiSnrTh0"), "longLongValue"]);
            -[WRM_iRATConfig setMinIdleWiFiSnrTh1:](self, "setMinIdleWiFiSnrTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiSnrTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiRssiTh0:](self, [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiRssiTh0"), "longLongValue"]);
            -[WRM_iRATConfig setMinIdleWiFiRssiTh1:](self, "setMinIdleWiFiRssiTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiRssiTh1"), "longLongValue")]);
            -[WRM_iRATConfig setSnrHysterisisWalking:](self, "setSnrHysterisisWalking:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"SnrHysterisisWalking"), "longLongValue"]);
            -[WRM_iRATConfig setSnrHysterisisRunning:](self, "setSnrHysterisisRunning:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"SnrHysterisisRunning"), "longLongValue"]);
            -[WRM_iRATConfig setRssiHysterisisWalking:](self, "setRssiHysterisisWalking:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"RssiHysterisisWalking"), "longLongValue"]);
            -[WRM_iRATConfig setRssiHysterisisRunning:](self, "setRssiHysterisisRunning:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"RssiHysterisisRunning"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiCcaTh0:](self, "setMinActiveWiFiCcaTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiCcaTh0"), "longLongValue"]);
            -[WRM_iRATConfig setMinActiveWiFiCcaTh1:](self, "setMinActiveWiFiCcaTh1:", [[objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiCcaTh1")) longLongValue];
            -[WRM_iRATConfig setMinIdleWiFiCcaTh0:](self, "setMinIdleWiFiCcaTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiCcaTh0"), "longLongValue"]);
            -[WRM_iRATConfig setMinIdleWiFiCcaTh1:](self, "setMinIdleWiFiCcaTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiCcaTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh0:](self, "setMinActiveWiFiTxPktLossRateTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiTxPktLossRateTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh1:](self, "setMinActiveWiFiTxPktLossRateTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiTxPktLossRateTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinActiveWiFiAvgTxPktLossRateTh:](self, "setMinActiveWiFiAvgTxPktLossRateTh:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinActiveWiFiAvgTxPktLossRateTh"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh0:](self, "setMinIdleWiFiTxPktLossRateTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiTxPktLossRateTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh1:](self, "setMinIdleWiFiTxPktLossRateTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiTxPktLossRateTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh0:](self, "setMinIdleWiFiFwTxPktLossRateTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiFwTxPktLossRateTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh1:](self, "setMinIdleWiFiFwTxPktLossRateTh1:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinIdleWiFiFwTxPktLossRateTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinWiFiBeaconPerTh0:](self, "setMinWiFiBeaconPerTh0:", [objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinWiFiBeaconPerTh0"), "longLongValue"]);
            [self setMinWiFiBeaconPerTh1:[[objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", @"MinWiFiBeaconPerTh1"), "longLongValue") longLongValue]];
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No WiFi specific config"];
          }
          id v14 = [v6 objectForKeyedSubscript:@"DataMetrics"];
          if (v14)
          {
            v15 = v14;
            -[WRM_iRATConfig setDataMinBtRssiTh0:](self, "setDataMinBtRssiTh0:", [objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", @"BTMinRssiTh0"), "longLongValue"]);
            -[WRM_iRATConfig setDataMinBtRssiTh1:](self, "setDataMinBtRssiTh1:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"BTMinRssiTh1"), "longLongValue"]);
            -[WRM_iRATConfig setDataBtMovingAvgAlphaDenum:](self, "setDataBtMovingAvgAlphaDenum:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"BtMovingAvgAlphaDenum"), "longLongValue")]);
            -[WRM_iRATConfig setDataBtStickinessTimeThreshMs:](self, "setDataBtStickinessTimeThreshMs:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"BtStickinessTimeThreshMs"), "longLongValue")]);
            -[WRM_iRATConfig setDataMinWifiRssiTh0:](self, "setDataMinWifiRssiTh0:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinRssiTh0"), "longLongValue"]);
            -[WRM_iRATConfig setDataMinWifiSnrTh0:](self, "setDataMinWifiSnrTh0:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinSnrTh0"), "longLongValue"]);
            -[WRM_iRATConfig setDataMinWifiRssiTh1:](self, "setDataMinWifiRssiTh1:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinRssiTh1"), "longLongValue"]);
            -[WRM_iRATConfig setDataMinWifiSnrTh1:](self, "setDataMinWifiSnrTh1:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinSnrTh1"), "longLongValue")]);
            -[WRM_iRATConfig setDataMinWifiBeaconPerTh0:](self, "setDataMinWifiBeaconPerTh0:", [objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinBeaconPerTh0"), "longLongValue"]);
            -[WRM_iRATConfig setDataWifiMinBeaconCount:[objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", @"WifiMinValidBeaconCount"), "longLongValue")];
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No Data specific config"];
          }
          id v16 = [v6 objectForKeyedSubscript:@"IDSWiFiMetrics"];
          if (v16)
          {
            v17 = v16;
            -[WRM_iRATConfig setIdsMinWiFiRssiTh0:](self, "setIdsMinWiFiRssiTh0:", [objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", @"IDSMinWiFiRssiTh0"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinWiFiRssiTh1:](self, "setIdsMinWiFiRssiTh1:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiRssiTh1"), "longLongValue"]);
            -[WRM_iRATConfig setIdsMinWiFiSnrTh0:](self, "setIdsMinWiFiSnrTh0:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiSnrTh0"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinWiFiSnrTh1:](self, "setIdsMinWiFiSnrTh1:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiSnrTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh0:](self, "setIdsMinAvgWiFiTxPktLossRateTh0:", [[objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinAvgWiFiTxPktLossRateTh0"), "longLongValue"]
            -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh1:](self, "setIdsMinAvgWiFiTxPktLossRateTh1:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinAvgWiFiTxPktLossRateTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinWiFiThroughputTh0:](self, "setIdsMinWiFiThroughputTh0:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiThroughputTh0"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinWiFiThroughputTh1:](self, "setIdsMinWiFiThroughputTh1:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiThroughputTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh0:](self, "setIdsMinWiFiEffectivePhyRateTh0:", [objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiEffectivePhyRateTh0"), "longLongValue"]);
            -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh1:](self, "setIdsMinWiFiEffectivePhyRateTh1:", [[objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", @"IDSMinWiFiEffectivePhyRateTh1"), "longLongValue") longLongValue]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No IDS WiFi specific config"];
          }
          id v18 = [v6 objectForKeyedSubscript:@"IDSMetricsIdsClient"];
          if (v18)
          {
            v19 = v18;
            -[WRM_iRATConfig setIdsPeriodicReportInterval:](self, "setIdsPeriodicReportInterval:", [objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", @"IDSPeriodicReportInterval"), "longLongValue")]);
            -[WRM_iRATConfig setIdsWiFiMinRttTh1:](self, "setIdsWiFiMinRttTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSWiFiMinRttTh1"), "longLongValue"]);
            -[WRM_iRATConfig setIdsBTMinRttTh1:](self, "setIdsBTMinRttTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSBTiMinRttTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsWiFiMinPerTh1:](self, "setIdsWiFiMinPerTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSWiFiMinPerTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsAvgWiFiMinPerTh1:](self, "setIdsAvgWiFiMinPerTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSAvgWiFiMinPerTh1"), "longLongValue")]);
            -[WRM_iRATConfig setIdsMovAvgWiFiMinPerTh1:](self, "setIdsMovAvgWiFiMinPerTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSMovAvgWiFiMinPerTh1"), "longLongValue"]);
            -[WRM_iRATConfig setIdsBTMinPerTh1:](self, "setIdsBTMinPerTh1:", [objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"IDSBTMinPerTh1"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No IDS Client specific config"];
          }
          id v20 = [v6 objectForKeyedSubscript:@"CellularMetrics"];
          if (v20)
          {
            v21 = v20;
            -[WRM_iRATConfig setMinSigBarTh0:](self, "setMinSigBarTh0:", [objc_msgSend(objc_msgSend(v20, "objectForKeyedSubscript:", @"MinSigBarTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinMovSigBarTh0:](self, "setMinMovSigBarTh0:", [objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"MinMovSigBarTh0"), "longLongValue")]);
            -[WRM_iRATConfig setMinSigBarTh1:](self, "setMinSigBarTh1:", [objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"MinSigBarTh1"), "longLongValue")]);
            -[WRM_iRATConfig setMinSigBarTh2:](self, "setMinSigBarTh2:", [objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"MinSigBarTh2"), "longLongValue")]);
            -[WRM_iRATConfig setSosWaypointRSRPTh:](self, "setSosWaypointRSRPTh:", [objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", @"SOSWaypointRSRPTh"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No Cellular specific config"];
          }
          id v22 = [v6 objectForKeyedSubscript:@"SymtompsMetrics"];
          if (v22)
          {
            v23 = v22;
            -[WRM_iRATConfig setTransportMetricsRateLimitingThreshold:](self, "setTransportMetricsRateLimitingThreshold:", [objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"TransportMetricsRateLimitingThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setTcpJitterThreshold:](self, "setTcpJitterThreshold:", [objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", @"TcpJitterThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setTcpRttThreshold:](self, "setTcpRttThreshold:", [objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", @"TcpRttThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setTcpIdleConnSuccessThreshold:](self, "setTcpIdleConnSuccessThreshold:", [objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", @"TcpIdleConnSuccessThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setTcpActiveConnSuccessThreshold:](self, "setTcpActiveConnSuccessThreshold:", [objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", @"TcpActiveConnSuccessThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setHistoricalAgeOfConnectedLinkInDays:](self, "setHistoricalAgeOfConnectedLinkInDays:", [objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", @"HistoricalAgeOfConnectedLinkInDays"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No Symtomps specific config"];
          }
          id v24 = [v6 objectForKeyedSubscript:@"FaceTimeMetrics"];
          if (v24)
          {
            v25 = v24;
            -[WRM_iRATConfig setFaceTimeCellularStickinessThreaholdActive:](self, "setFaceTimeCellularStickinessThreaholdActive:", [objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", @"FaceTimeCellularStickinessThreaholdActive"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:](self, "setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeMinActiveWiFiAvgTxPktLossRateTh"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeHandoverAvgRxPktLossThreshold:](self, [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeHandoverAvgRxPktLossThreshold"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeHandoverRxPktLossThreshold:](self, "setFaceTimeHandoverRxPktLossThreshold:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeHandoverRxPktLossThreshold"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh0:](self, "setFaceTimeMinActiveWiFiRssiTh0:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeMinActiveWiFiRssiTh0"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeMinActiveWiFiRssiTh1"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeEnhancedVideoMetricsEnabled:](self, "setFaceTimeEnhancedVideoMetricsEnabled:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeEnhancedVideoMetricsEnabled"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeMovingAverageWindow:](self, "setFaceTimeMovingAverageWindow:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeMovAvgWindow"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeVideoPacketLoss:[objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeVideoPktLoss"), "longLongValue")];
            -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh1:](self, "setFaceTimeAleratedModeRssiTh1:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedRssiTh1"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh0:](self, [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedRssiTh0"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeAleratedModeCCATh1:](self, "setFaceTimeAleratedModeCCATh1:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedCcaTh1"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeAleratedModeCCATh0:](self, "setFaceTimeAleratedModeCCATh0:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedCcaTh0"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeAleratedModeStationCount:](self, "setFaceTimeAleratedModeStationCount:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedStationCount"), "longLongValue"]);
            -[WRM_iRATConfig setFaceTimeAleratedModeVideoErasures:[objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedVidErasureTh1"), "longLongValue")];
            -[WRM_iRATConfig setFaceTimeAleratedModeTxPer1:](self, "setFaceTimeAleratedModeTxPer1:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedTxPerTh1"), "longLongValue")]);
            -[WRM_iRATConfig setFaceTimeAleratedModeTxPer0:](self, "setFaceTimeAleratedModeTxPer0:", [objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"FaceTimeAleratedTxPerTh0"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No FaceTime specific config"];
          }
          id v26 = [v6 objectForKeyedSubscript:@"CommCenterManagerMetrics"];
          if (v26)
          {
            v27 = v26;
            -[WRM_iRATConfig setCommCenterStickinessThreasholdWiFiProximity:](self, "setCommCenterStickinessThreasholdWiFiProximity:", [objc_msgSend(objc_msgSend(v26, "objectForKeyedSubscript:", @"CommCenterStickinessThreasholdWiFiProximity"), "longLongValue")]);
            -[WRM_iRATConfig setCommCenterStickinessThreasholdNotinWiFiProximity:](self, "setCommCenterStickinessThreasholdNotinWiFiProximity:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"CommCenterStickinessThreasholdNotinWiFiProximity"), "longLongValue")]);
            -[WRM_iRATConfig setCommCenterThumperStickinessThreasholdNotinBTProximity:](self, "setCommCenterThumperStickinessThreasholdNotinBTProximity:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"CommCenterThumperStickinessThreasholdNotinBTProximity"), "longLongValue")]);
            -[WRM_iRATConfig setCommCenterThumperStickinessThreasholdNotinBTProximity:](self, "setCommCenterThumperStickinessThreasholdNotinBTProximity:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"commCenterBTlpmThreasholdBTProximity"), "longLongValue")]);
            -[WRM_iRATConfig setCommCenterAppDebouncingTimer:](self, "setCommCenterAppDebouncingTimer:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"CommCenterAppDeboucingTimer"), "longLongValue")]);
            -[WRM_iRATConfig setCommCenterPeriodicBreadCrumTimer:](self, "setCommCenterPeriodicBreadCrumTimer:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"CommCenterPeriodicBreadCrumTimer"), "longLongValue"]);
            -[WRM_iRATConfig setCommCenterBreadCrumProcTimer:](self, "setCommCenterBreadCrumProcTimer:", [objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", @"CommCenterBreadCrumProcTimer"), "longLongValue"]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No CommCenterManager specific config"];
          }
          id v28 = [v6 objectForKeyedSubscript:@"CBRSMetrics"];
          if (v28)
          {
            v29 = v28;
            -[WRM_iRATConfig setCbrsEnterRsrpMin:](self, "setCbrsEnterRsrpMin:", [objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", @"CBRSEnterRsrpMin"), "longLongValue")]);
            -[WRM_iRATConfig setCbrsEnterRsrqMin:](self, "setCbrsEnterRsrqMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSEnterRsrqMin"), "longLongValue")]);
            -[WRM_iRATConfig setCbrsExitRsrpMin:](self, "setCbrsExitRsrpMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSExitRsrpMin"), "longLongValue")]);
            -[WRM_iRATConfig setCbrsExitRsrqMin:](self, "setCbrsExitRsrqMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSExitRsrqMin"), "longLongValue")]);
            -[WRM_iRATConfig setNonCbrsEnterRsrpMin:](self, "setNonCbrsEnterRsrpMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"NonCBRSEnterRsrpMin"), "longLongValue")]);
            -[WRM_iRATConfig setNonCbrsEnterRsrqMin:](self, "setNonCbrsEnterRsrqMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"NonCBRSEnterRsrqMin"), "longLongValue")]);
            -[WRM_iRATConfig setNonCbrsExitRsrpMin:](self, [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"nonCBRSExitRsrpMin"), "longLongValue"]);
            -[WRM_iRATConfig setNonCbrsExitRsrqMin:](self, "setNonCbrsExitRsrqMin:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"nonCBRSExitRsrqMin"), "longLongValue")]);
            -[WRM_iRATConfig setCbrsEnterRsrpOffset:](self, "setCbrsEnterRsrpOffset:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSEnterRsrpOffset"), "longLongValue"]);
            -[WRM_iRATConfig setCbrsEnterRsrqOffset:](self, "setCbrsEnterRsrqOffset:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSEnterRsrqOffset"), "longLongValue")]);
            -[WRM_iRATConfig setCbrsExitRsrpOffset:](self, [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSExitRsrpOffset"), "longLongValue"]);
            -[WRM_iRATConfig setCbrsExitRsrqOffset:](self, "setCbrsExitRsrqOffset:", [objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", @"CBRSExitRsrqOffset"), "longLongValue")]);
          }
          else
          {
            +[WCM_Logging logLevel:18 message:@"No cbrsConfig specific config"];
          }
          [(WRM_iRATConfig *)self printiRATConfig];
          CFStringRef v11 = @"===== Loading iRAT Configuration Policies completes. ";
        }
        else
        {
          CFStringRef v11 = @"No iRAT active config";
        }
      }
      else
      {
        CFStringRef v11 = @"No iRAT specific config found";
      }
    }
    else
    {
      CFStringRef v11 = @"No Policy found";
    }
    +[WCM_Logging logLevel:18 message:v11];
  }
  else
  {
    +[WCM_Logging logLevel:18 message:@"No Policy resource path found"];
  }
}

- (void)updateFaceTimeRSSITh:(int64_t)a3
{
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:");

  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiRssiTh0:a3 + 10];
}

- (void)revertFaceTimeThToAzul
{
  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiRssiTh1:-80];

  [(WRM_iRATConfig *)self setFaceTimeMinActiveWiFiRssiTh0:-70];
}

- (int64_t)handoverAlgorithmType
{
  return self->_handoverAlgorithmType;
}

- (void)setHandoverAlgorithmType:(int64_t)a3
{
  self->_handoverAlgorithmType = a3;
}

- (void)setCtServiceType:(int64_t)a3
{
  self->_ctServiceType = a3;
}

- (BOOL)handoverAlgorithmSettingDynamic
{
  return self->_handoverAlgorithmSettingDynamic;
}

- (void)setHandoverAlgorithmSettingDynamic:(BOOL)a3
{
  self->_handoverAlgorithmSettingDynamic = a3;
}

- (void)setPingPongAvoidanceThresholdStationary:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdStationary = a3;
}

- (int64_t)pingPongAvoidanceThresholdWalking
{
  return self->_pingPongAvoidanceThresholdWalking;
}

- (void)setPingPongAvoidanceThresholdWalking:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdWalking = a3;
}

- (int64_t)pingPongAvoidanceThresholdRunning
{
  return self->_pingPongAvoidanceThresholdRunning;
}

- (void)setPingPongAvoidanceThresholdRunning:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdRunning = a3;
}

- (int64_t)cellularStickinessThreaholdIdle
{
  return self->_cellularStickinessThreaholdIdle;
}

- (void)setCellularStickinessThreaholdIdle:(int64_t)a3
{
  self->_cellularStickinessThreaholdIdle = a3;
}

- (int64_t)cellularStickinessThreaholdActive
{
  return self->_cellularStickinessThreaholdActive;
}

- (void)setCellularStickinessThreaholdActive:(int64_t)a3
{
  self->_cellularStickinessThreaholdActive = a3;
}

- (int64_t)cellularStickinessThreaholdStationary
{
  return self->_cellularStickinessThreaholdStationary;
}

- (void)setCellularStickinessThreaholdStationary:(int64_t)a3
{
  self->_cellularStickinessThreaholdStationary = a3;
}

- (int64_t)cellularStickinessThreaholdStationaryActive
{
  return self->_cellularStickinessThreaholdStationaryActive;
}

- (void)setCellularStickinessThreaholdStationaryActive:(int64_t)a3
{
  self->_cellularStickinessThreaholdStationaryActive = a3;
}

- (BOOL)rtpMetricsEnabled
{
  return self->_rtpMetricsEnabled;
}

- (void)setRtpMetricsEnabled:(BOOL)a3
{
  self->_rtpMetricsEnabled = a3;
}

- (BOOL)wifiMetricsEnabled
{
  return self->_wifiMetricsEnabled;
}

- (void)setWifiMetricsEnabled:(BOOL)a3
{
  self->_wifiMetricsEnabled = a3;
}

- (BOOL)cellularMetricsEnabled
{
  return self->_cellularMetricsEnabled;
}

- (void)setCellularMetricsEnabled:(BOOL)a3
{
  self->_cellularMetricsEnabled = a3;
}

- (void)setSymtompsMetricsEnabled:(BOOL)a3
{
  self->_symtompsMetricsEnabled = a3;
}

- (BOOL)idsMetricsEnabled
{
  return self->_idsMetricsEnabled;
}

- (void)setIdsMetricsEnabled:(BOOL)a3
{
  self->_idsMetricsEnabled = a3;
}

- (BOOL)btMetricsEnabled
{
  return self->_btMetricsEnabled;
}

- (void)setBtMetricsEnabled:(BOOL)a3
{
  self->_btMetricsEnabled = a3;
}

- (BOOL)mobilityStateAwarenessEnabled
{
  return self->_mobilityStateAwarenessEnabled;
}

- (void)setMobilityStateAwarenessEnabled:(BOOL)a3
{
  self->_mobilityStateAwarenessEnabled = a3;
}

- (BOOL)qmiClientEnabled
{
  return self->_qmiClientEnabled;
}

- (void)setQmiClientEnabled:(BOOL)a3
{
  self->_qmiClientEnabled = a3;
}

- (BOOL)p2pAssistanceEnabled
{
  return self->_p2pAssistanceEnabled;
}

- (void)setP2pAssistanceEnabled:(BOOL)a3
{
  self->_p2pAssistanceEnabled = a3;
}

- (int64_t)periodicReportInterval
{
  return self->_periodicReportInterval;
}

- (void)setPeriodicReportInterval:(int64_t)a3
{
  self->_periodicReportInterval = a3;
}

- (int64_t)handoverRTThreshold
{
  return self->_handoverRTThreshold;
}

- (void)setHandoverRTThreshold:(int64_t)a3
{
  self->_handoverRTThreshold = a3;
}

- (int64_t)handoverRxJitterThreshold
{
  return self->_handoverRxJitterThreshold;
}

- (void)setHandoverRxJitterThreshold:(int64_t)a3
{
  self->_handoverRxJitterThreshold = a3;
}

- (int64_t)handoverRxPktLossThreshold
{
  return self->_handoverRxPktLossThreshold;
}

- (void)setHandoverRxPktLossThreshold:(int64_t)a3
{
  self->_handoverRxPktLossThreshold = a3;
}

- (int64_t)handoverAvgRxPktLossThreshold
{
  return self->_handoverAvgRxPktLossThreshold;
}

- (void)setHandoverAvgRxPktLossThreshold:(int64_t)a3
{
  self->_handoverAvgRxPktLossThreshold = a3;
}

- (int64_t)handoverAvgIdleRxPktLossThreshold
{
  return self->_handoverAvgIdleRxPktLossThreshold;
}

- (void)setHandoverAvgIdleRxPktLossThreshold:(int64_t)a3
{
  self->_handoverAvgIdleRxPktLossThreshold = a3;
}

- (int64_t)handoverTxPktLossThreshold
{
  return self->_handoverTxPktLossThreshold;
}

- (void)setHandoverTxPktLossThreshold:(int64_t)a3
{
  self->_handoverTxPktLossThreshold = a3;
}

- (int64_t)handoverNominalJitterBufferThreshold
{
  return self->_handoverNominalJitterBufferThreshold;
}

- (void)setHandoverNominalJitterBufferThreshold:(int64_t)a3
{
  self->_handoverNominalJitterBufferThreshold = a3;
}

- (int64_t)minActiveWiFiSnrTh0
{
  return self->_minActiveWiFiSnrTh0;
}

- (void)setMinActiveWiFiSnrTh0:(int64_t)a3
{
  self->_minActiveWiFiSnrTh0 = a3;
}

- (int64_t)minActiveWiFiSnrTh1
{
  return self->_minActiveWiFiSnrTh1;
}

- (void)setMinActiveWiFiSnrTh1:(int64_t)a3
{
  self->_minActiveWiFiSnrTh1 = a3;
}

- (int64_t)minActiveWiFiRssiTh0
{
  return self->_minActiveWiFiRssiTh0;
}

- (void)setMinActiveWiFiRssiTh0:(int64_t)a3
{
  self->_minActiveWiFiRssiTh0 = a3;
}

- (int64_t)minActiveWiFiRssiTh1
{
  return self->_minActiveWiFiRssiTh1;
}

- (void)setMinActiveWiFiRssiTh1:(int64_t)a3
{
  self->_minActiveWiFiRssiTh1 = a3;
}

- (int64_t)minActiveWiFiCcaTh0
{
  return self->_minActiveWiFiCcaTh0;
}

- (void)setMinActiveWiFiCcaTh0:(int64_t)a3
{
  self->_minActiveWiFiCcaTh0 = a3;
}

- (int64_t)minActiveWiFiCcaTh1
{
  return self->_minActiveWiFiCcaTh1;
}

- (void)setMinActiveWiFiCcaTh1:(int64_t)a3
{
  self->_minActiveWiFiCcaTh1 = a3;
}

- (int64_t)minIdleWiFiSnrTh0
{
  return self->_minIdleWiFiSnrTh0;
}

- (void)setMinIdleWiFiSnrTh0:(int64_t)a3
{
  self->_minIdleWiFiSnrTh0 = a3;
}

- (void)setMinIdleWiFiSnrTh1:(int64_t)a3
{
  self->_minIdleWiFiSnrTh1 = a3;
}

- (int64_t)minIdleWiFiRssiTh0
{
  return self->_minIdleWiFiRssiTh0;
}

- (void)setMinIdleWiFiRssiTh0:(int64_t)a3
{
  self->_minIdleWiFiRssiTh0 = a3;
}

- (void)setMinIdleWiFiRssiTh1:(int64_t)a3
{
  self->_minIdleWiFiRssiTh1 = a3;
}

- (int64_t)minIdleWiFiCcaTh0
{
  return self->_minIdleWiFiCcaTh0;
}

- (void)setMinIdleWiFiCcaTh0:(int64_t)a3
{
  self->_minIdleWiFiCcaTh0 = a3;
}

- (void)setMinIdleWiFiCcaTh1:(int64_t)a3
{
  self->_minIdleWiFiCcaTh1 = a3;
}

- (int64_t)minActiveWiFiTxPktLossRateTh0
{
  return self->_minActiveWiFiTxPktLossRateTh0;
}

- (void)setMinActiveWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_minActiveWiFiTxPktLossRateTh0 = a3;
}

- (int64_t)minActiveWiFiTxPktLossRateTh1
{
  return self->_minActiveWiFiTxPktLossRateTh1;
}

- (void)setMinActiveWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_minActiveWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)minActiveWiFiAvgTxPktLossRateTh
{
  return self->_minActiveWiFiAvgTxPktLossRateTh;
}

- (void)setMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3
{
  self->_minActiveWiFiAvgTxPktLossRateTh = a3;
}

- (int64_t)minIdleWiFiTxPktLossRateTh0
{
  return self->_minIdleWiFiTxPktLossRateTh0;
}

- (void)setMinIdleWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_minIdleWiFiTxPktLossRateTh0 = a3;
}

- (int64_t)minIdleWiFiTxPktLossRateTh1
{
  return self->_minIdleWiFiTxPktLossRateTh1;
}

- (void)setMinIdleWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_minIdleWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)minIdleWiFiFwTxPktLossRateTh0
{
  return self->_minIdleWiFiFwTxPktLossRateTh0;
}

- (void)setMinIdleWiFiFwTxPktLossRateTh0:(int64_t)a3
{
  self->_minIdleWiFiFwTxPktLossRateTh0 = a3;
}

- (int64_t)minIdleWiFiFwTxPktLossRateTh1
{
  return self->_minIdleWiFiFwTxPktLossRateTh1;
}

- (void)setMinIdleWiFiFwTxPktLossRateTh1:(int64_t)a3
{
  self->_minIdleWiFiFwTxPktLossRateTh1 = a3;
}

- (int64_t)minWiFiBeaconPerTh0
{
  return self->_minWiFiBeaconPerTh0;
}

- (void)setMinWiFiBeaconPerTh0:(int64_t)a3
{
  self->_minWiFiBeaconPerTh0 = a3;
}

- (void)setMinWiFiBeaconPerTh1:(int64_t)a3
{
  self->_minWiFiBeaconPerTh1 = a3;
}

- (int64_t)snrHysterisisWalking
{
  return self->_snrHysterisisWalking;
}

- (void)setSnrHysterisisWalking:(int64_t)a3
{
  self->_snrHysterisisWalking = a3;
}

- (int64_t)snrHysterisisRunning
{
  return self->_snrHysterisisRunning;
}

- (void)setSnrHysterisisRunning:(int64_t)a3
{
  self->_snrHysterisisRunning = a3;
}

- (int64_t)rssiHysterisisWalking
{
  return self->_rssiHysterisisWalking;
}

- (void)setRssiHysterisisWalking:(int64_t)a3
{
  self->_rssiHysterisisWalking = a3;
}

- (int64_t)rssiHysterisisRunning
{
  return self->_rssiHysterisisRunning;
}

- (void)setRssiHysterisisRunning:(int64_t)a3
{
  self->_rssiHysterisisRunning = a3;
}

- (int64_t)dataMinBtRssiTh0
{
  return self->_dataMinBtRssiTh0;
}

- (void)setDataMinBtRssiTh0:(int64_t)a3
{
  self->_dataMinBtRssiTh0 = a3;
}

- (int64_t)dataMinBtRssiTh1
{
  return self->_dataMinBtRssiTh1;
}

- (void)setDataMinBtRssiTh1:(int64_t)a3
{
  self->_dataMinBtRssiTh1 = a3;
}

- (int64_t)dataMinBtTxPerTh0
{
  return self->_dataMinBtTxPerTh0;
}

- (void)setDataMinBtTxPerTh0:(int64_t)a3
{
  self->_dataMinBtTxPerTh0 = a3;
}

- (int64_t)dataMinBtTxPerTh1
{
  return self->_dataMinBtTxPerTh1;
}

- (void)setDataMinBtTxPerTh1:(int64_t)a3
{
  self->_dataMinBtTxPerTh1 = a3;
}

- (int64_t)dataMinBtRxPerTh0
{
  return self->_dataMinBtRxPerTh0;
}

- (void)setDataMinBtRxPerTh0:(int64_t)a3
{
  self->_dataMinBtRxPerTh0 = a3;
}

- (int64_t)dataMinBtRxPerTh1
{
  return self->_dataMinBtRxPerTh1;
}

- (void)setDataMinBtRxPerTh1:(int64_t)a3
{
  self->_dataMinBtRxPerTh1 = a3;
}

- (int64_t)dataBtMovingAvgAlphaDenum
{
  return self->_dataBtMovingAvgAlphaDenum;
}

- (void)setDataBtMovingAvgAlphaDenum:(int64_t)a3
{
  self->_dataBtMovingAvgAlphaDenum = a3;
}

- (int64_t)dataBtStickinessTimeThreshMs
{
  return self->_dataBtStickinessTimeThreshMs;
}

- (void)setDataBtStickinessTimeThreshMs:(int64_t)a3
{
  self->_dataBtStickinessTimeThreshMs = a3;
}

- (int64_t)dataMinWifiRssiTh0
{
  return self->_dataMinWifiRssiTh0;
}

- (void)setDataMinWifiRssiTh0:(int64_t)a3
{
  self->_dataMinWifiRssiTh0 = a3;
}

- (int64_t)dataMinWifiSnrTh0
{
  return self->_dataMinWifiSnrTh0;
}

- (void)setDataMinWifiSnrTh0:(int64_t)a3
{
  self->_dataMinWifiSnrTh0 = a3;
}

- (int64_t)dataMinWifiRssiTh1
{
  return self->_dataMinWifiRssiTh1;
}

- (void)setDataMinWifiRssiTh1:(int64_t)a3
{
  self->_dataMinWifiRssiTh1 = a3;
}

- (int64_t)dataMinWifiSnrTh1
{
  return self->_dataMinWifiSnrTh1;
}

- (void)setDataMinWifiSnrTh1:(int64_t)a3
{
  self->_dataMinWifiSnrTh1 = a3;
}

- (int64_t)dataMinWifiBeaconPerTh0
{
  return self->_dataMinWifiBeaconPerTh0;
}

- (void)setDataMinWifiBeaconPerTh0:(int64_t)a3
{
  self->_dataMinWifiBeaconPerTh0 = a3;
}

- (void)setDataWifiMinBeaconCount:(int64_t)a3
{
  self->_dataWifiMinBeaconCount = a3;
}

- (int64_t)idsMinWiFiRssiTh0
{
  return self->_idsMinWiFiRssiTh0;
}

- (void)setIdsMinWiFiRssiTh0:(int64_t)a3
{
  self->_idsMinWiFiRssiTh0 = a3;
}

- (int64_t)idsMinWiFiRssiTh1
{
  return self->_idsMinWiFiRssiTh1;
}

- (void)setIdsMinWiFiRssiTh1:(int64_t)a3
{
  self->_idsMinWiFiRssiTh1 = a3;
}

- (int64_t)idsMinWiFiSnrTh0
{
  return self->_idsMinWiFiSnrTh0;
}

- (void)setIdsMinWiFiSnrTh0:(int64_t)a3
{
  self->_idsMinWiFiSnrTh0 = a3;
}

- (int64_t)idsMinWiFiSnrTh1
{
  return self->_idsMinWiFiSnrTh1;
}

- (void)setIdsMinWiFiSnrTh1:(int64_t)a3
{
  self->_idsMinWiFiSnrTh1 = a3;
}

- (int64_t)idsMinAvgWiFiTxPktLossRateTh0
{
  return self->_idsMinAvgWiFiTxPktLossRateTh0;
}

- (void)setIdsMinAvgWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_idsMinAvgWiFiTxPktLossRateTh0 = a3;
}

- (int64_t)idsMinAvgWiFiTxPktLossRateTh1
{
  return self->_idsMinAvgWiFiTxPktLossRateTh1;
}

- (void)setIdsMinAvgWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_idsMinAvgWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)idsMinWiFiThroughputTh0
{
  return self->_idsMinWiFiThroughputTh0;
}

- (void)setIdsMinWiFiThroughputTh0:(int64_t)a3
{
  self->_idsMinWiFiThroughputTh0 = a3;
}

- (int64_t)idsMinWiFiThroughputTh1
{
  return self->_idsMinWiFiThroughputTh1;
}

- (void)setIdsMinWiFiThroughputTh1:(int64_t)a3
{
  self->_idsMinWiFiThroughputTh1 = a3;
}

- (int64_t)idsMinWiFiEffectivePhyRateTh0
{
  return self->_idsMinWiFiEffectivePhyRateTh0;
}

- (void)setIdsMinWiFiEffectivePhyRateTh0:(int64_t)a3
{
  self->_idsMinWiFiEffectivePhyRateTh0 = a3;
}

- (int64_t)idsMinWiFiEffectivePhyRateTh1
{
  return self->_idsMinWiFiEffectivePhyRateTh1;
}

- (void)setIdsMinWiFiEffectivePhyRateTh1:(int64_t)a3
{
  self->_idsMinWiFiEffectivePhyRateTh1 = a3;
}

- (int64_t)idsPeriodicReportInterval
{
  return self->_idsPeriodicReportInterval;
}

- (void)setIdsPeriodicReportInterval:(int64_t)a3
{
  self->_idsPeriodicReportInterval = a3;
}

- (int64_t)idsWiFiMinRttTh1
{
  return self->_idsWiFiMinRttTh1;
}

- (void)setIdsWiFiMinRttTh1:(int64_t)a3
{
  self->_idsWiFiMinRttTh1 = a3;
}

- (int64_t)idsBTMinRttTh1
{
  return self->_idsBTMinRttTh1;
}

- (void)setIdsBTMinRttTh1:(int64_t)a3
{
  self->_idsBTMinRttTh1 = a3;
}

- (int64_t)idsWiFiMinPerTh1
{
  return self->_idsWiFiMinPerTh1;
}

- (void)setIdsWiFiMinPerTh1:(int64_t)a3
{
  self->_idsWiFiMinPerTh1 = a3;
}

- (int64_t)idsAvgWiFiMinPerTh1
{
  return self->_idsAvgWiFiMinPerTh1;
}

- (void)setIdsAvgWiFiMinPerTh1:(int64_t)a3
{
  self->_idsAvgWiFiMinPerTh1 = a3;
}

- (int64_t)idsMovAvgWiFiMinPerTh1
{
  return self->_idsMovAvgWiFiMinPerTh1;
}

- (void)setIdsMovAvgWiFiMinPerTh1:(int64_t)a3
{
  self->_idsMovAvgWiFiMinPerTh1 = a3;
}

- (int64_t)idsBTMinPerTh1
{
  return self->_idsBTMinPerTh1;
}

- (void)setIdsBTMinPerTh1:(int64_t)a3
{
  self->_idsBTMinPerTh1 = a3;
}

- (int64_t)minSigBarTh0
{
  return self->_minSigBarTh0;
}

- (void)setMinSigBarTh0:(int64_t)a3
{
  self->_minSigBarTh0 = a3;
}

- (void)setMinMovSigBarTh0:(int64_t)a3
{
  self->_minMovSigBarTh0 = a3;
}

- (int64_t)minSigBarTh1
{
  return self->_minSigBarTh1;
}

- (void)setMinSigBarTh1:(int64_t)a3
{
  self->_minSigBarTh1 = a3;
}

- (int64_t)minSigBarTh2
{
  return self->_minSigBarTh2;
}

- (void)setMinSigBarTh2:(int64_t)a3
{
  self->_minSigBarTh2 = a3;
}

- (int64_t)sosWaypointRSRPTh
{
  return self->_sosWaypointRSRPTh;
}

- (void)setSosWaypointRSRPTh:(int64_t)a3
{
  self->_sosWaypointRSRPTh = a3;
}

- (int64_t)transportMetricsRateLimitingThreshold
{
  return self->_transportMetricsRateLimitingThreshold;
}

- (void)setTransportMetricsRateLimitingThreshold:(int64_t)a3
{
  self->_transportMetricsRateLimitingThreshold = a3;
}

- (int64_t)tcpJitterThreshold
{
  return self->_tcpJitterThreshold;
}

- (void)setTcpJitterThreshold:(int64_t)a3
{
  self->_tcpJitterThreshold = a3;
}

- (int64_t)tcpRttThreshold
{
  return self->_tcpRttThreshold;
}

- (void)setTcpRttThreshold:(int64_t)a3
{
  self->_tcpRttThreshold = a3;
}

- (int64_t)tcpIdleConnSuccessThreshold
{
  return self->_tcpIdleConnSuccessThreshold;
}

- (void)setTcpIdleConnSuccessThreshold:(int64_t)a3
{
  self->_tcpIdleConnSuccessThreshold = a3;
}

- (int64_t)tcpActiveConnSuccessThreshold
{
  return self->_tcpActiveConnSuccessThreshold;
}

- (void)setTcpActiveConnSuccessThreshold:(int64_t)a3
{
  self->_tcpActiveConnSuccessThreshold = a3;
}

- (int64_t)historicalAgeOfConnectedLinkInDays
{
  return self->_historicalAgeOfConnectedLinkInDays;
}

- (void)setHistoricalAgeOfConnectedLinkInDays:(int64_t)a3
{
  self->_historicalAgeOfConnectedLinkInDays = a3;
}

- (int64_t)faceTimeCellularStickinessThreaholdActive
{
  return self->_faceTimeCellularStickinessThreaholdActive;
}

- (void)setFaceTimeCellularStickinessThreaholdActive:(int64_t)a3
{
  self->_faceTimeCellularStickinessThreaholdActive = a3;
}

- (int64_t)faceTimeMinActiveWiFiAvgTxPktLossRateTh
{
  return self->_faceTimeMinActiveWiFiAvgTxPktLossRateTh;
}

- (void)setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiAvgTxPktLossRateTh = a3;
}

- (int64_t)faceTimeHandoverAvgRxPktLossThreshold
{
  return self->_faceTimeHandoverAvgRxPktLossThreshold;
}

- (void)setFaceTimeHandoverAvgRxPktLossThreshold:(int64_t)a3
{
  self->_faceTimeHandoverAvgRxPktLossThreshold = a3;
}

- (int64_t)faceTimeHandoverRxPktLossThreshold
{
  return self->_faceTimeHandoverRxPktLossThreshold;
}

- (void)setFaceTimeHandoverRxPktLossThreshold:(int64_t)a3
{
  self->_faceTimeHandoverRxPktLossThreshold = a3;
}

- (int64_t)faceTimeMinActiveWiFiRssiTh1
{
  return self->_faceTimeMinActiveWiFiRssiTh1;
}

- (void)setFaceTimeMinActiveWiFiRssiTh1:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiRssiTh1 = a3;
}

- (int64_t)faceTimeMinActiveWiFiRssiTh0
{
  return self->_faceTimeMinActiveWiFiRssiTh0;
}

- (void)setFaceTimeMinActiveWiFiRssiTh0:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiRssiTh0 = a3;
}

- (int64_t)faceTimeEnhancedVideoMetricsEnabled
{
  return self->_faceTimeEnhancedVideoMetricsEnabled;
}

- (void)setFaceTimeEnhancedVideoMetricsEnabled:(int64_t)a3
{
  self->_faceTimeEnhancedVideoMetricsEnabled = a3;
}

- (int64_t)faceTimeMovingAverageWindow
{
  return self->_faceTimeMovingAverageWindow;
}

- (void)setFaceTimeMovingAverageWindow:(int64_t)a3
{
  self->_faceTimeMovingAverageWindow = a3;
}

- (int64_t)faceTimeVideoPacketLoss
{
  return self->_faceTimeVideoPacketLoss;
}

- (void)setFaceTimeVideoPacketLoss:(int64_t)a3
{
  self->_faceTimeVideoPacketLoss = a3;
}

- (int64_t)faceTimeAleratedModeRssiTh1
{
  return self->_faceTimeAleratedModeRssiTh1;
}

- (void)setFaceTimeAleratedModeRssiTh1:(int64_t)a3
{
  self->_faceTimeAleratedModeRssiTh1 = a3;
}

- (int64_t)faceTimeAleratedModeRssiTh0
{
  return self->_faceTimeAleratedModeRssiTh0;
}

- (void)setFaceTimeAleratedModeRssiTh0:(int64_t)a3
{
  self->_faceTimeAleratedModeRssiTh0 = a3;
}

- (int64_t)faceTimeAleratedModeCCATh1
{
  return self->_faceTimeAleratedModeCCATh1;
}

- (void)setFaceTimeAleratedModeCCATh1:(int64_t)a3
{
  self->_faceTimeAleratedModeCCATh1 = a3;
}

- (int64_t)faceTimeAleratedModeCCATh0
{
  return self->_faceTimeAleratedModeCCATh0;
}

- (void)setFaceTimeAleratedModeCCATh0:(int64_t)a3
{
  self->_faceTimeAleratedModeCCATh0 = a3;
}

- (int64_t)faceTimeAleratedModeStationCount
{
  return self->_faceTimeAleratedModeStationCount;
}

- (void)setFaceTimeAleratedModeStationCount:(int64_t)a3
{
  self->_faceTimeAleratedModeStationCount = a3;
}

- (int64_t)faceTimeAleratedModeVideoErasures
{
  return self->_faceTimeAleratedModeVideoErasures;
}

- (void)setFaceTimeAleratedModeVideoErasures:(int64_t)a3
{
  self->_faceTimeAleratedModeVideoErasures = a3;
}

- (int64_t)faceTimeAleratedModeTxPer1
{
  return self->_faceTimeAleratedModeTxPer1;
}

- (void)setFaceTimeAleratedModeTxPer1:(int64_t)a3
{
  self->_faceTimeAleratedModeTxPer1 = a3;
}

- (int64_t)faceTimeAleratedModeTxPer0
{
  return self->_faceTimeAleratedModeTxPer0;
}

- (void)setFaceTimeAleratedModeTxPer0:(int64_t)a3
{
  self->_faceTimeAleratedModeTxPer0 = a3;
}

- (int64_t)commCenterStickinessThreasholdWiFiProximity
{
  return self->_commCenterStickinessThreasholdWiFiProximity;
}

- (void)setCommCenterStickinessThreasholdWiFiProximity:(int64_t)a3
{
  self->_commCenterStickinessThreasholdWiFiProximity = a3;
}

- (int64_t)commCenterStickinessThreasholdNotinWiFiProximity
{
  return self->_commCenterStickinessThreasholdNotinWiFiProximity;
}

- (void)setCommCenterStickinessThreasholdNotinWiFiProximity:(int64_t)a3
{
  self->_commCenterStickinessThreasholdNotinWiFiProximity = a3;
}

- (int64_t)commCenterThumperStickinessThreasholdNotinBTProximity
{
  return self->_commCenterThumperStickinessThreasholdNotinBTProximity;
}

- (void)setCommCenterThumperStickinessThreasholdNotinBTProximity:(int64_t)a3
{
  self->_commCenterThumperStickinessThreasholdNotinBTProximity = a3;
}

- (int64_t)commCenterBTlpmThreasholdBTProximity
{
  return self->_commCenterBTlpmThreasholdBTProximity;
}

- (void)setCommCenterBTlpmThreasholdBTProximity:(int64_t)a3
{
  self->_commCenterBTlpmThreasholdBTProximity = a3;
}

- (int64_t)commCenterAppDebouncingTimer
{
  return self->_commCenterAppDebouncingTimer;
}

- (void)setCommCenterAppDebouncingTimer:(int64_t)a3
{
  self->_commCenterAppDebouncingTimer = a3;
}

- (int64_t)commCenterPeriodicBreadCrumTimer
{
  return self->_commCenterPeriodicBreadCrumTimer;
}

- (void)setCommCenterPeriodicBreadCrumTimer:(int64_t)a3
{
  self->_commCenterPeriodicBreadCrumTimer = a3;
}

- (int64_t)commCenterBreadCrumProcTimer
{
  return self->_commCenterBreadCrumProcTimer;
}

- (void)setCommCenterBreadCrumProcTimer:(int64_t)a3
{
  self->_commCenterBreadCrumProcTimer = a3;
}

- (int64_t)cbrsEnterRsrpMin
{
  return self->_cbrsEnterRsrpMin;
}

- (void)setCbrsEnterRsrpMin:(int64_t)a3
{
  self->_cbrsEnterRsrpMin = a3;
}

- (int64_t)cbrsEnterRsrqMin
{
  return self->_cbrsEnterRsrqMin;
}

- (void)setCbrsEnterRsrqMin:(int64_t)a3
{
  self->_cbrsEnterRsrqMin = a3;
}

- (int64_t)cbrsExitRsrpMin
{
  return self->_cbrsExitRsrpMin;
}

- (void)setCbrsExitRsrpMin:(int64_t)a3
{
  self->_cbrsExitRsrpMin = a3;
}

- (int64_t)cbrsExitRsrqMin
{
  return self->_cbrsExitRsrqMin;
}

- (void)setCbrsExitRsrqMin:(int64_t)a3
{
  self->_cbrsExitRsrqMin = a3;
}

- (int64_t)nonCbrsEnterRsrpMin
{
  return self->_nonCbrsEnterRsrpMin;
}

- (void)setNonCbrsEnterRsrpMin:(int64_t)a3
{
  self->_nonCbrsEnterRsrpMin = a3;
}

- (int64_t)nonCbrsEnterRsrqMin
{
  return self->_nonCbrsEnterRsrqMin;
}

- (void)setNonCbrsEnterRsrqMin:(int64_t)a3
{
  self->_nonCbrsEnterRsrqMin = a3;
}

- (int64_t)nonCbrsExitRsrpMin
{
  return self->_nonCbrsExitRsrpMin;
}

- (void)setNonCbrsExitRsrpMin:(int64_t)a3
{
  self->_nonCbrsExitRsrpMin = a3;
}

- (int64_t)nonCbrsExitRsrqMin
{
  return self->_nonCbrsExitRsrqMin;
}

- (void)setNonCbrsExitRsrqMin:(int64_t)a3
{
  self->_nonCbrsExitRsrqMin = a3;
}

- (int64_t)cbrsEnterRsrpOffset
{
  return self->_cbrsEnterRsrpOffset;
}

- (void)setCbrsEnterRsrpOffset:(int64_t)a3
{
  self->_cbrsEnterRsrpOffset = a3;
}

- (int64_t)cbrsEnterRsrqOffset
{
  return self->_cbrsEnterRsrqOffset;
}

- (void)setCbrsEnterRsrqOffset:(int64_t)a3
{
  self->_cbrsEnterRsrqOffset = a3;
}

- (int64_t)cbrsExitRsrpOffset
{
  return self->_cbrsExitRsrpOffset;
}

- (void)setCbrsExitRsrpOffset:(int64_t)a3
{
  self->_cbrsExitRsrpOffset = a3;
}

- (int64_t)cbrsExitRsrqOffset
{
  return self->_cbrsExitRsrqOffset;
}

- (void)setCbrsExitRsrqOffset:(int64_t)a3
{
  self->_cbrsExitRsrqOffset = a3;
}

@end