@interface WCM_WiFiService
- (BOOL)deviceAssociatedOnPreferredNetwork;
- (BOOL)didWiFiDeviceReset;
- (BOOL)getAirplayStatus;
- (BOOL)getP2pRCU2CoexEventStatus;
- (BOOL)getWghtAverageMetricsValid;
- (BOOL)isAWDLInProgress;
- (BOOL)isAssociated;
- (BOOL)isAutoUnlockRangingInProgress;
- (BOOL)isBeaconPerValid;
- (BOOL)isBeaconSchedValid;
- (BOOL)isCarPlaySessionInProgress;
- (BOOL)isCoPresenceInProgress;
- (BOOL)isCumulativeFwTxPerValid;
- (BOOL)isCumulativeTxPerValid;
- (BOOL)isEnsembleInProgress;
- (BOOL)isFwTxPerValid;
- (BOOL)isLSMWiFiQualityGood;
- (BOOL)isMovingAverageTxPerValid;
- (BOOL)isQBSSLoadValid;
- (BOOL)isRetryValid;
- (BOOL)isRxPacketLossObserved;
- (BOOL)isRxRatioValid;
- (BOOL)isSideCarInProgress;
- (BOOL)isSlowWiFi;
- (BOOL)isTxPerValid;
- (BOOL)isWiFiConnected;
- (BOOL)isWiFiNetworkCaptive;
- (BOOL)isWiFiPrimaryInterface;
- (BOOL)isWiFiQualityGoodForProximityMode;
- (BOOL)isWoWEnabled;
- (BOOL)setLQMReportInterval:(int)a3;
- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4;
- (WCM_WiFiService)init;
- (double)getAdjustedBeaconPer;
- (double)getBeaconPer;
- (double)getCumulativeFwTxPer;
- (double)getCumulativeTxPer;
- (double)getFwTxPer;
- (double)getMovingAverageTxPer;
- (double)getMovingAvgOfRxRetryPercent;
- (double)getRxRatio;
- (double)getRxRetryPercent;
- (double)getTxFail;
- (double)getTxPer;
- (double)getTxRetryPercent;
- (float)calculatePhyRate;
- (float)getBWScallingFactor;
- (float)getCalculatedAvailableRxPhyBandwidth;
- (float)getCalculatedAvailableTxPhyBandwidth;
- (float)getEstimatedAvailableRxPhyBandwidth;
- (float)getL3Bandwidth:(float)a3 :(float)a4;
- (float)getRxPhyRate;
- (float)getTxPhyRate;
- (float)getprevRxPhyRate;
- (id)getLeastCongestedWifiParam;
- (int)getBEDecision;
- (int)getBadVideoCounter;
- (int)getBadVoiceCounter;
- (int)getCarPlayScanRelaxReason;
- (int)getChannelUtlization;
- (int)getConnectedStationCount;
- (int)getGoodVideoCounter;
- (int)getGoodVoiceCounter;
- (int)getInvalidCounter;
- (int)getLifeTimeBE;
- (int)getLifeTimeBK;
- (int)getLifeTimeVI;
- (int)getLifeTimeVO;
- (int)getPhyMode;
- (int)getPointOfInterest;
- (int)getStationCountWithPendingData;
- (int)getTxLossRateBE;
- (int)getTxLossRateBK;
- (int)getTxLossRateVI;
- (int)getTxLossRateVO;
- (int)getTxThroughputBE;
- (int)getTxThroughputBK;
- (int)getTxThroughputVI;
- (int)getTxThroughputVO;
- (int)getVoiceDecision;
- (int)getWghtAverageRSSI;
- (int)getWghtAverageSNR;
- (int64_t)getAvgRSSI;
- (int64_t)getCCA;
- (int64_t)getNumberOfSpatialStream;
- (int64_t)getNumberOfSpatialStreamOnAccessPoint;
- (int64_t)getRSSI;
- (int64_t)getRxPacket;
- (int64_t)getSNR;
- (unsigned)getChannelType;
- (unsigned)getWghtAverageRXPhyRate;
- (unsigned)getWghtAverageTXPhyRate;
- (unsigned)getWiFiBW;
- (void)dealloc;
- (void)getMinMaxAvailableRxBandwidth:(id *)a3;
- (void)initializeiRATMetrics;
- (void)registerWiFiCallbacks;
- (void)resetCumulativeCounters;
- (void)resetStationCount:(int)a3;
- (void)resetWghtAverageMetricsFlag;
- (void)resetWiFiBWEstimationState;
- (void)setDelegate:(id)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setSNR:(int64_t)a3;
- (void)setWoWState:(unsigned __int8)a3;
- (void)unregisterWiFiCallbacks;
- (void)updateBEDecision:(int)a3;
- (void)updateBadVideoCounter:(int)a3;
- (void)updateBadVoiceCounter:(int)a3;
- (void)updateCCA:(int64_t)a3;
- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4;
- (void)updateChanUtilization:(int)a3;
- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4;
- (void)updateCurrentHostAPState:(BOOL)a3 channel:(int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 apState:(int)a7;
- (void)updateFwTxPer;
- (void)updateFwTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5;
- (void)updateGoodVideoCounter:(int)a3;
- (void)updateGoodVoiceCounter:(int)a3;
- (void)updateInvalidCounter:(int)a3;
- (void)updateLifeTimeBE:(int)a3;
- (void)updateLifeTimeBK:(int)a3;
- (void)updateLifeTimeVI:(int)a3;
- (void)updateLifeTimeVO:(int)a3;
- (void)updatePhyRates:(int64_t)a3 :(int64_t)a4 :(int64_t)a5;
- (void)updateRxBeaconPer;
- (void)updateRxBeacons:(int64_t)a3 :(int64_t)a4;
- (void)updateRxRatio;
- (void)updateRxStats:(int64_t)a3 :(int64_t)a4;
- (void)updateStationCount:(int)a3;
- (void)updateTxLossRateBE:(int)a3;
- (void)updateTxLossRateBK:(int)a3;
- (void)updateTxLossRateVI:(int)a3;
- (void)updateTxLossRateVO:(int)a3;
- (void)updateTxPer;
- (void)updateTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5;
- (void)updateTxThroughputBE:(int)a3;
- (void)updateTxThroughputBK:(int)a3;
- (void)updateTxThroughputVI:(int)a3;
- (void)updateTxThroughputVO:(int)a3;
- (void)updateVoiceDecision:(int)a3;
- (void)updateWeightedAverageMetrics:(int)a3 :(int)a4 :(unsigned int)a5 :(unsigned int)a6;
@end

@implementation WCM_WiFiService

- (double)getTxPer
{
  return self->m_txPer;
}

- (int64_t)getCCA
{
  return self->m_cca;
}

- (BOOL)isTxPerValid
{
  BOOL v2 = self->m_txFail + self->m_txFrame >= 30 && self->m_txPer != -600.0;
  self->m_valid_tx_error_measurements = v2;
  return v2;
}

- (BOOL)isFwTxPerValid
{
  BOOL v2 = self->m_fw_txFrame >= 15 && self->m_fw_txPer != -600.0;
  self->m_valid_fw_tx_error_measurements = v2;
  return v2;
}

- (BOOL)isCumulativeFwTxPerValid
{
  return self->m_cumulative_txFrame > 99;
}

- (BOOL)isBeaconPerValid
{
  return self->m_valid_beacon_per;
}

- (int)getWghtAverageSNR
{
  return self->m_wghtAvgSNR;
}

- (int)getWghtAverageRSSI
{
  return self->m_wghtAvgRSSI;
}

- (double)getTxFail
{
  return (double)self->m_txFail;
}

- (int64_t)getSNR
{
  return self->m_Snr;
}

- (double)getRxRatio
{
  return self->m_rxRetryRatio;
}

- (int64_t)getRSSI
{
  return self->m_rawRssi;
}

- (double)getFwTxPer
{
  return self->m_fw_txPer;
}

- (double)getCumulativeTxPer
{
  return self->m_cumulative_txPer;
}

- (double)getCumulativeFwTxPer
{
  return self->m_cumulative_fw_txPer;
}

- (double)getBeaconPer
{
  return self->m_beaconPer;
}

- (void)updateWeightedAverageMetrics:(int)a3 :(int)a4 :(unsigned int)a5 :(unsigned int)a6
{
  self->m_wghtAvgMetricsValid = 1;
  self->m_wghtAvgRSSI = a3;
  self->m_wghtAvgSNR = a4;
  self->m_wghtAvgTXPhyRate = a5;
  self->m_wghtAvgRXPhyRate = a6;
  [(WCM_WiFiDelegate *)self->mDelegate updateWeightAvgLQM:*(void *)&a6 txRate:*(void *)&a5];
}

- (void)updateTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  if (a3 != -600 && a4 != -600 && a5 != -600)
  {
    self->m_txFrame = a3;
    self->m_txRetrans = a4;
    int64_t m_cumulative_txFrame = self->m_cumulative_txFrame;
    int64_t v7 = self->m_cumulative_txRetrans + a4;
    self->m_txFail = a5;
    self->int64_t m_cumulative_txFrame = m_cumulative_txFrame + a3;
    self->m_cumulative_txRetrans = v7;
    self->m_cumulative_txFail += a5;
    v8.i64[0] = a3;
    v8.i64[1] = a5;
    __asm
    {
      FMOV            V2.2D, #5.0
      FMOV            V1.2D, #6.0
    }
    *(float64x2_t *)&self->m_movingAverage_txFrame = vdivq_f64(vmlaq_f64(vcvtq_f64_s64(v8), _Q2, *(float64x2_t *)&self->m_movingAverage_txFrame), _Q1);
    [(WCM_WiFiService *)self updateTxPer];
    +[WCM_Logging logLevel:19, @"WiFi TX Stats: TX Fail %lld, Tx Frame %lld, Cum Tx Fail %lld, Cum TX Frame %lld, M-AVG TxFrame %f, M-AVG TxFail %f, M-AVG TX PER %f", self->m_txFail, self->m_txFrame, self->m_cumulative_txFail, self->m_cumulative_txFrame, *(void *)&self->m_movingAverage_txFrame, *(void *)&self->m_movingAverage_txFail, *(void *)&self->m_movingAverageTxPer message];
  }
}

- (void)updateTxPer
{
  double v3 = (double)self->m_txFail / ((double)self->m_txFrame + 0.000001);
  if (v3 < 0.0 || v3 > 1.0)
  {
    +[WCM_Logging logLevel:16, @"Invalid TX per number! %lf", *(void *)&v3 message];
    double v3 = -600.0;
  }
  else
  {
    double v5 = self->m_movingAverage_txFail / (self->m_movingAverage_txFrame + 0.000001);
    self->m_cumulative_txPer = (double)self->m_cumulative_txFail / ((double)self->m_cumulative_txFrame + 0.000001);
    self->m_movingAverageTxPer = v5;
  }
  self->m_txPer = v3;
}

- (void)updateStationCount:(int)a3
{
  self->m_connectedStationCount = a3;
  self->m_apSupportsQbssLoad = 1;
}

- (void)updateRxStats:(int64_t)a3 :(int64_t)a4
{
  if (a3 != -600 && a4 != -600)
  {
    int64_t m_movingAvgRxRetrans = self->m_movingAvgRxRetrans;
    int64_t v5 = (a3 + 11 * self->m_movingAvgRxFrame) / 12;
    self->m_rxFrame = a3;
    self->m_rxRetrans = a4;
    self->m_movingAvgRxFrame = v5;
    self->int64_t m_movingAvgRxRetrans = (a4 + 11 * m_movingAvgRxRetrans) / 12;
  }
}

- (void)updateRxRatio
{
  int64_t m_rxFrame = self->m_rxFrame;
  int64_t m_rxRetrans = self->m_rxRetrans;
  self->m_rxRetryRatio = (double)m_rxRetrans / ((double)m_rxFrame + 0.000001);
  double v4 = (double)m_rxRetrans / ((double)(m_rxFrame + m_rxRetrans) + 0.000001);
  int64_t m_movingAvgRxRetrans = self->m_movingAvgRxRetrans;
  double v6 = (double)m_movingAvgRxRetrans;
  uint64_t v7 = self->m_movingAvgRxFrame + m_movingAvgRxRetrans;
  self->m_rxRetryPercent = v4;
  self->m_rxMovingAvgRetryPercent = v6 / ((double)v7 + 0.000001);
  double v8 = 1.0;
  if (v4 != 0.0)
  {
    double v9 = (self->m_rxPrevRetryPercent - v4) * 100.0;
    if (v9 != 0.0) {
      double v8 = v9 / (v4 * -100.0 + 1.0 + 0.000001) + 1.0;
    }
  }
  self->m_rxScalingFactor = v8;
  self->m_rxPrevRetryPercent = v4;
}

- (void)updateRxBeacons:(int64_t)a3 :(int64_t)a4
{
  BOOL v4 = 0;
  if (a3 <= a4 && a4 && a3 != -600 && a4 != -600)
  {
    self->m_rxBeacons = a3;
    self->m_rxBeaconSched = a4;
    BOOL v4 = 1;
  }
  self->m_valid_beacon_per = v4;
}

- (void)updateRxBeaconPer
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  int64_t m_rxBeacons = self->m_rxBeacons;
  int64_t m_rxBeaconSched = self->m_rxBeaconSched;
  if (m_rxBeacons >= m_rxBeaconSched) {
    int64_t m_rxBeacons = self->m_rxBeaconSched;
  }
  double v6 = 1.0 - (double)m_rxBeacons / ((double)m_rxBeaconSched + 0.000001);
  if (v6 < 0.0 || v6 > 1.0)
  {
    +[WCM_Logging logLevel:16, @"Invalid Beacon per number! %lf", *(void *)&v6 message];
    int64_t m_rxBeaconSched = self->m_rxBeaconSched;
  }
  else
  {
    double v8 = v6 * 0.2 + self->m_beaconPer * 0.8;
    self->m_beaconPer = v6;
    self->m_movAvg_beaconPer = v8;
  }
  self->m_beaconPerIsValid = m_rxBeaconSched > (uint64_t)[v3 dataWifiMinBeaconCount];
}

- (void)updatePhyRates:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  if (a5 <= 989999 && a4 >= 1000 && a3 >= 1000 && a5 >= 1000)
  {
    self->m_prevRxPhyRate = self->m_rxPhyRate;
    self->m_txPhyRate = (float)a3 / 1000.0;
    self->m_txFBPhyRate = (float)a4 / 1000.0;
    self->m_rxPhyRate = (float)a5 / 1000.0;
  }
}

- (void)updateFwTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  if (a3 != -600 && a4 != -600 && a5 != -600)
  {
    self->m_fw_txFrame = a3;
    self->m_fw_txRetrans = a4;
    self->m_fw_txFail = a5;
    int64_t v7 = self->m_cumulative_fw_txFrame + a3;
    int64_t v8 = self->m_cumulative_fw_txRetrans + a4;
    self->m_cumulative_fw_txFrame = v7;
    self->m_cumulative_fw_txRetrans = v8;
    int64_t v9 = self->m_cumulative_fw_txFail + a5;
    self->m_cumulative_fw_txFail = v9;
    +[WCM_Logging logLevel:18, @"WiFi Stats: FW TX Fail %lld, FW Tx Frame %lld FW Cum TX Fail %lld,FW  Cum Tx Frame %lld", a5, a3, v9, v7, v5, v6 message];
  }
}

- (void)updateFwTxPer
{
  double v3 = (double)self->m_fw_txFail / ((double)self->m_fw_txFrame + 0.000001);
  if (v3 < 0.0 || v3 > 1.0)
  {
    +[WCM_Logging logLevel:16, @"Invalid FW TX per number! %lf", *(void *)&v3 message];
    double v3 = -600.0;
  }
  else
  {
    self->m_cumulative_fw_txPer = (double)self->m_cumulative_fw_txFail
                                / ((double)self->m_cumulative_fw_txFrame + 0.000001);
  }
  self->m_fw_txPer = v3;
}

- (void)updateChanUtilization:(int)a3
{
  self->m_channelUtilization = (int)(float)((float)((float)a3 * 100.0) / 255.0);
}

- (void)updateCCA:(int64_t)a3
{
  if (a3 != -600) {
    self->m_cca = a3;
  }
}

- (void)setSNR:(int64_t)a3
{
  if (a3 != -600)
  {
    BOOL m_valid_snr_measurement = self->m_valid_snr_measurement;
    self->m_Snr = a3;
    if (!m_valid_snr_measurement) {
      self->BOOL m_valid_snr_measurement = 1;
    }
  }
}

- (void)setRSSI:(int64_t)a3
{
  if (a3 != -600)
  {
    if (!self->m_valid_rssi_measurement) {
      self->m_valid_rssi_measurement = 1;
    }
    self->m_rawRssi = a3;
    int64_t v3 = self->m_sample_Size + 1;
    int64_t v4 = self->m_cumRawRssi + a3;
    self->m_sample_Size = v3;
    self->m_cumRawRssi = v4;
    self->m_avgRawRssi = (uint64_t)((double)v4 / ((double)v3 + 0.000001));
  }
}

- (BOOL)isSideCarInProgress
{
  return 0;
}

- (BOOL)isEnsembleInProgress
{
  return 0;
}

- (BOOL)isAutoUnlockRangingInProgress
{
  return 0;
}

- (WCM_WiFiService)init
{
  +[WCM_Logging logLevel:2 message:@"WCM_WiFiService init"];
  v6.receiver = self;
  v6.super_class = (Class)WCM_WiFiService;
  int64_t v3 = [(WCM_WiFiService *)&v6 init];
  int64_t v4 = v3;
  if (v3)
  {
    v3->mDelegate = 0;
    [(WCM_WiFiService *)v3 initializeiRATMetrics];
  }
  return v4;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"WCM_WiFiService dealloc"];
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiService;
  [(WCM_WiFiService *)&v3 dealloc];
}

- (void)registerWiFiCallbacks
{
}

- (void)unregisterWiFiCallbacks
{
}

- (BOOL)isAssociated
{
  return 0;
}

- (BOOL)isAWDLInProgress
{
  return 0;
}

- (BOOL)isCarPlaySessionInProgress
{
  return 0;
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
}

- (int)getCarPlayScanRelaxReason
{
  return 4;
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
}

- (id)getLeastCongestedWifiParam
{
  return 0;
}

- (BOOL)didWiFiDeviceReset
{
  return 0;
}

- (int)getPhyMode
{
  return 0;
}

- (BOOL)isCoPresenceInProgress
{
  return 0;
}

- (int64_t)getNumberOfSpatialStream
{
  return 0;
}

- (int64_t)getNumberOfSpatialStreamOnAccessPoint
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (WCM_WiFiDelegate *)a3;
}

- (void)updateCurrentHostAPState:(BOOL)a3 channel:(int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 apState:(int)a7
{
  mDelegate = self->mDelegate;
  if (a3)
  {
    [(WCM_WiFiDelegate *)mDelegate updateWiFiState:*(void *)&a7 channel:*(void *)&a4 centerFreq:*(void *)&a5 bandwidth:*(void *)&a6 hostAp:1];
    v10 = self->mDelegate;
    BOOL v11 = a7 > 2;
  }
  else
  {
    [(WCM_WiFiDelegate *)mDelegate updateWiFiState:*(void *)&a7 channel:0 centerFreq:0 bandwidth:0 hostAp:0];
    v10 = self->mDelegate;
    BOOL v11 = 0;
  }

  [(WCM_WiFiDelegate *)v10 update5GHzHostAPState:v11];
}

- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  return 0;
}

- (void)initializeiRATMetrics
{
  *(_OWORD *)&self->m_txFrame = 0u;
  p_m_txFrame = &self->m_txFrame;
  *(_OWORD *)(p_m_txFrame - 5) = xmmword_1001EB200;
  *((_OWORD *)p_m_txFrame + 1) = 0u;
  *((_OWORD *)p_m_txFrame + 2) = 0u;
  *((_OWORD *)p_m_txFrame + 3) = 0u;
  *((_OWORD *)p_m_txFrame + 4) = 0u;
  *((_OWORD *)p_m_txFrame + 5) = 0u;
  *((_OWORD *)p_m_txFrame + 6) = 0u;
  *((_OWORD *)p_m_txFrame + 7) = 0u;
  *((_OWORD *)p_m_txFrame + 8) = 0u;
  *((_OWORD *)p_m_txFrame + 9) = 0u;
  *((_OWORD *)p_m_txFrame + 10) = 0u;
  *((_OWORD *)p_m_txFrame + 11) = 0u;
  *((_OWORD *)p_m_txFrame + 12) = 0u;
  *((_OWORD *)p_m_txFrame + 13) = 0u;
  *(_OWORD *)((char *)p_m_txFrame + 217) = 0u;
  p_m_txFrame[30] = 0;
  p_m_txFrame[31] = 0;
  p_m_txFrame[32] = 0;
  p_m_txFrame[33] = 0x3FF0000000000000;
  *(int64_t *)((char *)p_m_txFrame + 292) = 0x477DE800477DE800;
  *((_DWORD *)p_m_txFrame + 76) = 1199433728;
  *((_DWORD *)p_m_txFrame + 80) = 0;
  *((unsigned char *)p_m_txFrame + 324) = 0;
  *((unsigned char *)p_m_txFrame + 288) = 0;
  *((_DWORD *)p_m_txFrame - 12) = 0;
  *((unsigned char *)p_m_txFrame - 44) = 0;
  *(int64_t *)((char *)p_m_txFrame + 308) = 0;
  *((unsigned char *)p_m_txFrame + 316) = 0;
  p_m_txFrame[41] = 0;
  p_m_txFrame[42] = 0;
  *((_OWORD *)p_m_txFrame + 25) = 0u;
  *((_OWORD *)p_m_txFrame + 26) = 0u;
  p_m_txFrame[54] = 0;
}

- (BOOL)setLQMReportInterval:(int)a3
{
  return 1;
}

- (int64_t)getAvgRSSI
{
  return self->m_avgRawRssi;
}

- (float)calculatePhyRate
{
  float result = (double)self->m_Snr * 2.692 + -0.4397;
  if (result < 0.0) {
    return 1.0;
  }
  return result;
}

- (float)getTxPhyRate
{
  return self->m_txPhyRate;
}

- (float)getprevRxPhyRate
{
  return self->m_prevRxPhyRate;
}

- (float)getRxPhyRate
{
  return self->m_rxPhyRate;
}

- (float)getEstimatedAvailableRxPhyBandwidth
{
  [(WCM_WiFiService *)self calculatePhyRate];
  float v4 = v3;
  [(WCM_WiFiService *)self getRxRetryPercent];
  double v6 = v5;
  [(WCM_WiFiService *)self getTxRetryPercent];
  double v8 = v7;
  int64_t v9 = [(WCM_WiFiService *)self getRxPacket];
  uint64_t v10 = [(WCM_WiFiService *)self getStationCountWithPendingData];
  if ((int)v10 >= 2) {
    float v4 = v4 / (float)(int)v10;
  }
  +[WCM_Logging logLevel:28, @"getEstimatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f, RX Packet Count: %lld,Station Count: %d", *(void *)&v6, *(void *)&v8, v9, v10 message];
  if (v9) {
    double v11 = v6;
  }
  else {
    double v11 = v8;
  }
  return (1.0 - v11) * v4;
}

- (float)getCalculatedAvailableRxPhyBandwidth
{
  [(WCM_WiFiService *)self getRxPhyRate];
  float v4 = v3;
  [(WCM_WiFiService *)self getprevRxPhyRate];
  float v6 = (float)(v4 + v5) * 0.5;
  [(WCM_WiFiService *)self getRxRetryPercent];
  double v8 = v7;
  [(WCM_WiFiService *)self getTxRetryPercent];
  double v10 = v9;
  int64_t v11 = [(WCM_WiFiService *)self getRxPacket];
  uint64_t v12 = [(WCM_WiFiService *)self getConnectedStationCount];
  if ((int)v12 >= 2) {
    float v6 = v6 / (float)(int)v12;
  }
  +[WCM_Logging logLevel:28, @"getCalculatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d", *(void *)&v8, *(void *)&v10, v11, v12 message];
  if (v11) {
    double v13 = v8;
  }
  else {
    double v13 = v10;
  }
  return (1.0 - v13) * v6;
}

- (void)getMinMaxAvailableRxBandwidth:(id *)a3
{
  [(WCM_WiFiService *)self getRxPhyRate];
  float v6 = v5;
  if ([(WCM_WiFiService *)self isQBSSLoadValid])
  {
    +[WCM_Logging logLevel:28, @"QBSS load valid, load: %lld \n", [(WCM_WiFiService *)self getChannelUtlization] message];
    float v7 = (float)(v6 * (float)(100 - [(WCM_WiFiService *)self getChannelUtlization])) / 100.0;
    int v8 = [(WCM_WiFiService *)self getConnectedStationCount];
    uint64_t v9 = (v8 / 3);
    if (v8 >= 9)
    {
      float v10 = v7 / (float)(int)v9;
      goto LABEL_6;
    }
  }
  else
  {
    +[WCM_Logging logLevel:28, @"QBSS load not valid, CCA: %lld \n", [(WCM_WiFiService *)self getCCA] message];
    uint64_t v9 = 0;
    float v7 = (float)(v6 * (float)(100 - [(WCM_WiFiService *)self getCCA])) / 100.0;
  }
  float v10 = v7 * 0.5;
LABEL_6:
  [(WCM_WiFiService *)self getRxRetryPercent];
  double v12 = v11;
  [(WCM_WiFiService *)self getTxRetryPercent];
  double v14 = v13;
  int64_t v15 = [(WCM_WiFiService *)self getRxPacket];
  +[WCM_Logging logLevel:28, @"getCalculatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d", *(void *)&v12, *(void *)&v14, v15, v9 message];
  if (v15) {
    double v16 = v12;
  }
  else {
    double v16 = v14;
  }
  double v17 = 1.0 - v16;
  double v18 = v17 * v7;
  double v19 = v17 * v10;
  float v20 = v19;
  *(float *)&double v19 = v18;
  LODWORD(v18) = 1152319488;
  [(WCM_WiFiService *)self getL3Bandwidth:v18 :v19];
  float v22 = v21;
  LODWORD(v23) = 1152319488;
  *(float *)&double v24 = v20;
  [(WCM_WiFiService *)self getL3Bandwidth:v23 :v24];
  float v26 = v25;
  +[WCM_Logging logLevel:28, @"Estimated Min Bandwitdh: %.2f, Max Bandwidth: %.2f, Rate: %.2f", v25, v22, v6 message];
  float v27 = (float)(v26 + (float)(self->m_minMovAvgBW * 11.0)) / 12.0;
  self->m_minMovAvgBW = v27;
  float v28 = (float)(v22 + (float)(self->m_maxMovAvgBW * 11.0)) / 12.0;
  self->m_maxMovAvgBW = v28;
  +[WCM_Logging logLevel:28, @"Estimated Min AVG Bandwitdh: %.2f, Max AVG Bandwidth: %.2f", v27, v28 message];
  *(uint64x2_t *)&a3->var2 = vcvtq_u64_f64(vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&self->m_minMovAvgBW, (float32x2_t)vdup_n_s32(0x447A0000u))));
  a3->var0 = (unint64_t)(float)(v26 * 1000.0);
  a3->var1 = (unint64_t)(float)(v22 * 1000.0);
}

- (float)getBWScallingFactor
{
  return self->m_rxScalingFactor;
}

- (float)getCalculatedAvailableTxPhyBandwidth
{
  [(WCM_WiFiService *)self getTxPhyRate];
  float v4 = v3;
  [(WCM_WiFiService *)self getRxRetryPercent];
  double v6 = v5;
  [(WCM_WiFiService *)self getTxRetryPercent];
  double v8 = v7;
  int64_t v9 = [(WCM_WiFiService *)self getRxPacket];
  uint64_t v10 = [(WCM_WiFiService *)self getStationCountWithPendingData];
  +[WCM_Logging logLevel:28, @"getCalculatedAvailableTxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d", *(void *)&v6, *(void *)&v8, v9, v10 message];
  if ((int)v10 >= 2) {
    float v4 = v4 / (float)(int)v10;
  }
  if (self->m_txFrame + self->m_fw_txFrame) {
    double v11 = v8;
  }
  else {
    double v11 = v6;
  }
  return (1.0 - v11) * v4;
}

- (float)getL3Bandwidth:(float)a3 :(float)a4
{
  float v4 = ceil((float)((float)((float)(a3 + 38.0) * 8.0) + 6.0) / a4) + 36.0;
  double v5 = v4;
  float v6 = a3 * 8.0 / v5;
  +[WCM_Logging logLevel:28, @"iRAT: WIFI L3 Pkt Time: %.2f, L3 Throughput : %.2f", *(void *)&v5, v6 message];
  return v6;
}

- (int)getChannelUtlization
{
  return self->m_channelUtilization;
}

- (int)getConnectedStationCount
{
  if (self->m_connectedStationCount >= 50) {
    return 0;
  }
  else {
    return self->m_connectedStationCount;
  }
}

- (int)getStationCountWithPendingData
{
  return self->m_connectedStationCount;
}

- (double)getTxRetryPercent
{
  int64_t v2 = self->m_fw_txRetrans + self->m_txRetrans;
  double result = (double)v2 / ((double)(v2 + self->m_txFrame + self->m_fw_txFrame) + 0.000001);
  self->m_txRetryPercent = result;
  return result;
}

- (double)getMovingAverageTxPer
{
  return self->m_movingAverageTxPer;
}

- (BOOL)isMovingAverageTxPerValid
{
  return self->m_movingAverage_txFrame + self->m_movingAverage_txFail >= 180.0;
}

- (double)getAdjustedBeaconPer
{
  uint64_t v2 = 280;
  if (self->m_rxBeaconSched > 19) {
    uint64_t v2 = 272;
  }
  return *(double *)((char *)&self->super.isa + v2);
}

- (BOOL)isBeaconSchedValid
{
  return self->m_beaconPerIsValid;
}

- (BOOL)isRetryValid
{
  return self->m_txRetrans + self->m_txFrame >= 180 && self->m_txPer != -600.0;
}

- (BOOL)isCumulativeTxPerValid
{
  return self->m_cumulative_txFrame > 199;
}

- (void)resetCumulativeCounters
{
  self->m_movingAverageTxPer = 0.0;
  *(_OWORD *)&self->m_movingAverage_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_txFail = 0u;
  *(_OWORD *)&self->int64_t m_cumulative_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_fw_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_fw_txFail = 0u;
}

- (void)resetWiFiBWEstimationState
{
  self->m_rxRetryRatio = 0.0;
  *(void *)&self->m_minMovAvgBW = 0;
  self->m_movingAvgRxFrame = 0;
  self->int64_t m_movingAvgRxRetrans = 0;
  *(_OWORD *)&self->m_rxRetryPercent = 0u;
  *(_OWORD *)&self->m_rxMovingAvgRetryPercent = 0u;
}

- (BOOL)isRxPacketLossObserved
{
  return self->m_rxRetrans > 0;
}

- (BOOL)isRxRatioValid
{
  int64_t m_rxRetrans = self->m_rxRetrans;
  if (m_rxRetrans) {
    BOOL v3 = self->m_rxFrame + m_rxRetrans <= 29;
  }
  else {
    BOOL v3 = 1;
  }
  BOOL v4 = !v3;
  self->m_valid_rx_error_measurements = v4;
  return v4;
}

- (double)getRxRetryPercent
{
  return self->m_rxRetryPercent;
}

- (double)getMovingAvgOfRxRetryPercent
{
  return self->m_rxMovingAvgRetryPercent;
}

- (int64_t)getRxPacket
{
  return self->m_rxRetrans + self->m_rxFrame;
}

- (BOOL)isQBSSLoadValid
{
  return self->m_apSupportsQbssLoad;
}

- (void)resetStationCount:(int)a3
{
  self->m_connectedStationCount = a3;
  self->m_apSupportsQbssLoad = 0;
}

- (BOOL)isWiFiNetworkCaptive
{
  return 0;
}

- (BOOL)isWoWEnabled
{
  return self->m_WoWEnabled != 0;
}

- (void)setWoWState:(unsigned __int8)a3
{
  self->m_WoWEnabled = a3;
}

- (BOOL)isWiFiConnected
{
  return 1;
}

- (BOOL)isWiFiPrimaryInterface
{
  return 1;
}

- (int)getTxLossRateBE
{
  return self->m_txPacketLossBE;
}

- (int)getTxLossRateBK
{
  return self->m_txPacketLossBK;
}

- (int)getTxLossRateVI
{
  return self->m_txPacketLossVI;
}

- (int)getTxLossRateVO
{
  return self->m_txPacketLossVO;
}

- (void)updateTxLossRateBE:(int)a3
{
  self->m_txPacketLossBE = a3;
}

- (void)updateTxLossRateBK:(int)a3
{
  self->m_txPacketLossBK = a3;
}

- (void)updateTxLossRateVI:(int)a3
{
  self->m_txPacketLossVI = a3;
}

- (void)updateTxLossRateVO:(int)a3
{
  self->m_txPacketLossVO = a3;
}

- (int)getTxThroughputBE
{
  return self->m_txThroughputEstBE;
}

- (int)getTxThroughputBK
{
  return self->m_txThroughputEstBK;
}

- (int)getTxThroughputVI
{
  return self->m_txThroughputEstVI;
}

- (int)getTxThroughputVO
{
  return self->m_txThroughputEstVO;
}

- (void)updateTxThroughputBE:(int)a3
{
  self->m_txThroughputEstBE = a3;
}

- (void)updateTxThroughputBK:(int)a3
{
  self->m_txThroughputEstBK = a3;
}

- (void)updateTxThroughputVI:(int)a3
{
  self->m_txThroughputEstVI = a3;
}

- (void)updateTxThroughputVO:(int)a3
{
  self->m_txThroughputEstVO = a3;
}

- (int)getLifeTimeBE
{
  return self->m_txPacketLifetimeBE;
}

- (int)getLifeTimeBK
{
  return self->m_txPacketLifetimeBK;
}

- (int)getLifeTimeVI
{
  return self->m_txPacketLifetimeVI;
}

- (int)getLifeTimeVO
{
  return self->m_txPacketLifetimeVO;
}

- (void)updateLifeTimeBE:(int)a3
{
  self->m_txPacketLifetimeBE = a3;
}

- (void)updateLifeTimeBK:(int)a3
{
  self->m_txPacketLifetimeBK = a3;
}

- (void)updateLifeTimeVI:(int)a3
{
  self->m_txPacketLifetimeVI = a3;
}

- (void)updateLifeTimeVO:(int)a3
{
  self->m_txPacketLifetimeVO = a3;
}

- (int)getBadVoiceCounter
{
  int v2 = self->m_currentBadVoiceCounter - self->m_prevBadVoiceCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getGoodVoiceCounter
{
  int v2 = self->m_currentGoodVoiceCounter - self->m_prevGoodVoiceCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getBadVideoCounter
{
  int v2 = self->m_currentBadVideoCounter - self->m_prevBadVideoCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getGoodVideoCounter
{
  int v2 = self->m_currentGoodVoideoCounter - self->m_prevGoodVideoCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getInvalidCounter
{
  int v2 = self->m_currentInvalidCounter - self->m_prevInvalidCounter;
  return v2 & ~(v2 >> 31);
}

- (void)updateBadVoiceCounter:(int)a3
{
  self->m_prevBadVoiceCounter = self->m_currentBadVoiceCounter;
  self->m_currentBadVoiceCounter = a3;
}

- (void)updateGoodVoiceCounter:(int)a3
{
  self->m_prevGoodVoiceCounter = self->m_currentGoodVoiceCounter;
  self->m_currentGoodVoiceCounter = a3;
}

- (void)updateBadVideoCounter:(int)a3
{
  self->m_prevBadVideoCounter = self->m_currentBadVideoCounter;
  self->m_currentBadVideoCounter = a3;
}

- (void)updateGoodVideoCounter:(int)a3
{
  self->m_prevGoodVideoCounter = self->m_currentGoodVoideoCounter;
  self->m_currentGoodVoideoCounter = a3;
}

- (void)updateInvalidCounter:(int)a3
{
  self->m_prevInvalidCounter = self->m_currentInvalidCounter;
  self->m_currentInvalidCounter = a3;
}

- (void)updateVoiceDecision:(int)a3
{
  self->m_decisionVO = a3;
}

- (int)getVoiceDecision
{
  return self->m_decisionVO;
}

- (int)getBEDecision
{
  return self->m_decisionVI_BE;
}

- (void)updateBEDecision:(int)a3
{
  self->m_decisionVI_BE = a3;
}

- (BOOL)deviceAssociatedOnPreferredNetwork
{
  return 1;
}

- (int)getPointOfInterest
{
  return 3;
}

- (BOOL)getAirplayStatus
{
  return 0;
}

- (BOOL)getP2pRCU2CoexEventStatus
{
  return 0;
}

- (BOOL)isWiFiQualityGoodForProximityMode
{
  uint64_t v3 = [(WCM_WiFiService *)self getRSSI];
  uint64_t v4 = [(WCM_WiFiService *)self getSNR];
  [(WCM_WiFiService *)self getBeaconPer];
  double v6 = v5;
  unsigned int v7 = [(WCM_WiFiService *)self isAssociated];
  id v8 = [[WRM_HandoverManager WRM_HandoverManagerSingleton] getiRATConfigController];
  unsigned int v9 = [(WCM_WiFiService *)self isWiFiPrimaryInterface];
  BOOL result = 0;
  if (v9 && v7) {
    return v4 >= 11
  }
        && v3 > (uint64_t)[v8 dataMinWifiRssiTh0]
        && v6 * 100.0 < (double)(uint64_t)[v8 dataMinWifiBeaconPerTh0]
        && [(WCM_WiFiService *)self isLSMWiFiQualityGood];
  return result;
}

- (BOOL)isLSMWiFiQualityGood
{
  int m_decisionVI_BE = self->m_decisionVI_BE;
  if (m_decisionVI_BE == 1) {
    return 1;
  }
  if (m_decisionVI_BE) {
    return self->m_txPacketLossVI < 16;
  }
  return 0;
}

- (void)resetWghtAverageMetricsFlag
{
  self->m_wghtAvgMetricsValid = 0;
}

- (BOOL)getWghtAverageMetricsValid
{
  return self->m_wghtAvgMetricsValid;
}

- (unsigned)getWghtAverageTXPhyRate
{
  return self->m_wghtAvgTXPhyRate;
}

- (BOOL)isSlowWiFi
{
  return 0;
}

- (unsigned)getWghtAverageRXPhyRate
{
  return self->m_wghtAvgRXPhyRate;
}

- (unsigned)getWiFiBW
{
  return 0;
}

- (unsigned)getChannelType
{
  return 0;
}

@end