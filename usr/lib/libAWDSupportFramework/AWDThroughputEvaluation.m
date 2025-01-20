@interface AWDThroughputEvaluation
- (BOOL)cellNsaEnabled;
- (BOOL)hasActualHighBandwidth;
- (BOOL)hasActualLowBandwidth;
- (BOOL)hasAppType;
- (BOOL)hasBadDecisionsCounterVIBE;
- (BOOL)hasBadDecisionsCounterVO;
- (BOOL)hasBcnPer;
- (BOOL)hasBtRssi;
- (BOOL)hasBtWiFiCoexState;
- (BOOL)hasBufferInterval;
- (BOOL)hasCca;
- (BOOL)hasCellARFCN;
- (BOOL)hasCellBandInfo;
- (BOOL)hasCellChannelBW;
- (BOOL)hasCellEstimatedBW;
- (BOOL)hasCellLteRSRQ;
- (BOOL)hasCellModelConfidenceLevel;
- (BOOL)hasCellModelVersion;
- (BOOL)hasCellNrRSRP;
- (BOOL)hasCellNrRSRQ;
- (BOOL)hasCellNrSNR;
- (BOOL)hasCellNsaEnabled;
- (BOOL)hasCellRsrp;
- (BOOL)hasCellSinr;
- (BOOL)hasCmDataSentCount;
- (BOOL)hasCmDataSentDuration;
- (BOOL)hasCmEstimatedBandwidth;
- (BOOL)hasColdStartType;
- (BOOL)hasDecisionVIBE;
- (BOOL)hasDecisionVO;
- (BOOL)hasDeviation;
- (BOOL)hasDevicePointOfInterest;
- (BOOL)hasEstimatedHighBandwidth;
- (BOOL)hasEstimatedLowBandwidth;
- (BOOL)hasEstimatedSpeed;
- (BOOL)hasEvent;
- (BOOL)hasExpectedThroughputVIBE;
- (BOOL)hasExpectedThroughputVO;
- (BOOL)hasGoodDecisionsCounterVIBE;
- (BOOL)hasGoodDecisionsCounterVO;
- (BOOL)hasInvalidDecisionsCounterVIBE;
- (BOOL)hasInvalidDecisionsCounterVO;
- (BOOL)hasIsFR1;
- (BOOL)hasIsWfiCaptive;
- (BOOL)hasLqmScoreBT;
- (BOOL)hasLqmScoreWifi;
- (BOOL)hasLqmScorecellular;
- (BOOL)hasLteMaxScheduledMimoLayersInACell;
- (BOOL)hasMaxDLCAConfigured;
- (BOOL)hasMaxOfActualLowBandwidth;
- (BOOL)hasMaxULCAConfigured;
- (BOOL)hasMlPredictedCellBW;
- (BOOL)hasMlPredictedWiFiBW;
- (BOOL)hasMovingAvgHighBandwidth;
- (BOOL)hasMovingAvgLowBandwidth;
- (BOOL)hasNrConfiguredBw;
- (BOOL)hasNrMaxDlModulation;
- (BOOL)hasNrTotalScheduledMimoLayers;
- (BOOL)hasPActualLowBandwidth;
- (BOOL)hasPacketLifetimeVIBE;
- (BOOL)hasPacketLossRateVIBE;
- (BOOL)hasPhyRate;
- (BOOL)hasPkgLifeTimeVO;
- (BOOL)hasPktLifeTimeVO;
- (BOOL)hasPktLossRateVO;
- (BOOL)hasQbssLoad;
- (BOOL)hasRatType;
- (BOOL)hasRatioDupeBytes;
- (BOOL)hasRatioOOBBytes;
- (BOOL)hasRrcState;
- (BOOL)hasRxRetransmissionRate;
- (BOOL)hasRxRetry;
- (BOOL)hasTcpRTTAvg;
- (BOOL)hasTcpRTTmin;
- (BOOL)hasTcpRTTvar;
- (BOOL)hasTotalConfiguredBw;
- (BOOL)hasTotalConfiguredMimoLayers;
- (BOOL)hasTxRetransmissionRate;
- (BOOL)hasTxber;
- (BOOL)hasVideoStreamingStallTime;
- (BOOL)hasWeightedAveragePhyrateRx;
- (BOOL)hasWeightedAveragePhyrateTx;
- (BOOL)hasWeightedAverageRssi;
- (BOOL)hasWeightedAverageSnr;
- (BOOL)hasWifChannelBW;
- (BOOL)hasWifChannelType;
- (BOOL)hasWifiCapability;
- (BOOL)hasWifiModelConfidenceLevel;
- (BOOL)hasWifiModelVersion;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiSinr;
- (BOOL)hasWifichannel;
- (BOOL)hasWifiguardinterval;
- (BOOL)hasWifilowDataMode;
- (BOOL)hasWifimcsindex;
- (BOOL)hasWifinumberOfSpatialStreams;
- (BOOL)hasWrmRecommendedRAT;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFR1;
- (BOOL)readFrom:(id)a3;
- (NSString)appType;
- (NSString)ratType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)btRssi;
- (int)btWiFiCoexState;
- (int)cellLteRSRQ;
- (int)cellNrRSRP;
- (int)cellNrRSRQ;
- (int)cellNrSNR;
- (int)cellRsrp;
- (int)cellSinr;
- (int)deviation;
- (int)isWfiCaptive;
- (int)lqmScoreBT;
- (int)lqmScoreWifi;
- (int)lqmScorecellular;
- (int)pActualLowBandwidth;
- (int)wifiSinr;
- (int)wifichannel;
- (int)wifiguardinterval;
- (int)wifilowDataMode;
- (int)wifimcsindex;
- (int)wifinumberOfSpatialStreams;
- (int64_t)wifiRssi;
- (unint64_t)hash;
- (unsigned)actualHighBandwidth;
- (unsigned)actualLowBandwidth;
- (unsigned)badDecisionsCounterVIBE;
- (unsigned)badDecisionsCounterVO;
- (unsigned)bcnPer;
- (unsigned)bufferInterval;
- (unsigned)cca;
- (unsigned)cellARFCN;
- (unsigned)cellBandInfo;
- (unsigned)cellChannelBW;
- (unsigned)cellEstimatedBW;
- (unsigned)cellModelConfidenceLevel;
- (unsigned)cellModelVersion;
- (unsigned)cmDataSentCount;
- (unsigned)cmDataSentDuration;
- (unsigned)cmEstimatedBandwidth;
- (unsigned)coldStartType;
- (unsigned)decisionVIBE;
- (unsigned)decisionVO;
- (unsigned)devicePointOfInterest;
- (unsigned)estimatedHighBandwidth;
- (unsigned)estimatedLowBandwidth;
- (unsigned)estimatedSpeed;
- (unsigned)event;
- (unsigned)expectedThroughputVIBE;
- (unsigned)expectedThroughputVO;
- (unsigned)goodDecisionsCounterVIBE;
- (unsigned)goodDecisionsCounterVO;
- (unsigned)invalidDecisionsCounterVIBE;
- (unsigned)invalidDecisionsCounterVO;
- (unsigned)lteMaxScheduledMimoLayersInACell;
- (unsigned)maxDLCAConfigured;
- (unsigned)maxOfActualLowBandwidth;
- (unsigned)maxULCAConfigured;
- (unsigned)mlPredictedCellBW;
- (unsigned)mlPredictedWiFiBW;
- (unsigned)movingAvgHighBandwidth;
- (unsigned)movingAvgLowBandwidth;
- (unsigned)nrConfiguredBw;
- (unsigned)nrMaxDlModulation;
- (unsigned)nrTotalScheduledMimoLayers;
- (unsigned)packetLifetimeVIBE;
- (unsigned)packetLossRateVIBE;
- (unsigned)phyRate;
- (unsigned)pkgLifeTimeVO;
- (unsigned)pktLifeTimeVO;
- (unsigned)pktLossRateVO;
- (unsigned)qbssLoad;
- (unsigned)ratioDupeBytes;
- (unsigned)ratioOOBBytes;
- (unsigned)rrcState;
- (unsigned)rxRetransmissionRate;
- (unsigned)rxRetry;
- (unsigned)tcpRTTAvg;
- (unsigned)tcpRTTmin;
- (unsigned)tcpRTTvar;
- (unsigned)totalConfiguredBw;
- (unsigned)totalConfiguredMimoLayers;
- (unsigned)txRetransmissionRate;
- (unsigned)txber;
- (unsigned)videoStreamingStallTime;
- (unsigned)weightedAveragePhyrateRx;
- (unsigned)weightedAveragePhyrateTx;
- (unsigned)weightedAverageRssi;
- (unsigned)weightedAverageSnr;
- (unsigned)wifChannelBW;
- (unsigned)wifChannelType;
- (unsigned)wifiCapability;
- (unsigned)wifiModelConfidenceLevel;
- (unsigned)wifiModelVersion;
- (unsigned)wrmRecommendedRAT;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActualHighBandwidth:(unsigned int)a3;
- (void)setActualLowBandwidth:(unsigned int)a3;
- (void)setAppType:(id)a3;
- (void)setBadDecisionsCounterVIBE:(unsigned int)a3;
- (void)setBadDecisionsCounterVO:(unsigned int)a3;
- (void)setBcnPer:(unsigned int)a3;
- (void)setBtRssi:(int)a3;
- (void)setBtWiFiCoexState:(int)a3;
- (void)setBufferInterval:(unsigned int)a3;
- (void)setCca:(unsigned int)a3;
- (void)setCellARFCN:(unsigned int)a3;
- (void)setCellBandInfo:(unsigned int)a3;
- (void)setCellChannelBW:(unsigned int)a3;
- (void)setCellEstimatedBW:(unsigned int)a3;
- (void)setCellLteRSRQ:(int)a3;
- (void)setCellModelConfidenceLevel:(unsigned int)a3;
- (void)setCellModelVersion:(unsigned int)a3;
- (void)setCellNrRSRP:(int)a3;
- (void)setCellNrRSRQ:(int)a3;
- (void)setCellNrSNR:(int)a3;
- (void)setCellNsaEnabled:(BOOL)a3;
- (void)setCellRsrp:(int)a3;
- (void)setCellSinr:(int)a3;
- (void)setCmDataSentCount:(unsigned int)a3;
- (void)setCmDataSentDuration:(unsigned int)a3;
- (void)setCmEstimatedBandwidth:(unsigned int)a3;
- (void)setColdStartType:(unsigned int)a3;
- (void)setDecisionVIBE:(unsigned int)a3;
- (void)setDecisionVO:(unsigned int)a3;
- (void)setDeviation:(int)a3;
- (void)setDevicePointOfInterest:(unsigned int)a3;
- (void)setEstimatedHighBandwidth:(unsigned int)a3;
- (void)setEstimatedLowBandwidth:(unsigned int)a3;
- (void)setEstimatedSpeed:(unsigned int)a3;
- (void)setEvent:(unsigned int)a3;
- (void)setExpectedThroughputVIBE:(unsigned int)a3;
- (void)setExpectedThroughputVO:(unsigned int)a3;
- (void)setGoodDecisionsCounterVIBE:(unsigned int)a3;
- (void)setGoodDecisionsCounterVO:(unsigned int)a3;
- (void)setHasActualHighBandwidth:(BOOL)a3;
- (void)setHasActualLowBandwidth:(BOOL)a3;
- (void)setHasBadDecisionsCounterVIBE:(BOOL)a3;
- (void)setHasBadDecisionsCounterVO:(BOOL)a3;
- (void)setHasBcnPer:(BOOL)a3;
- (void)setHasBtRssi:(BOOL)a3;
- (void)setHasBtWiFiCoexState:(BOOL)a3;
- (void)setHasBufferInterval:(BOOL)a3;
- (void)setHasCca:(BOOL)a3;
- (void)setHasCellARFCN:(BOOL)a3;
- (void)setHasCellBandInfo:(BOOL)a3;
- (void)setHasCellChannelBW:(BOOL)a3;
- (void)setHasCellEstimatedBW:(BOOL)a3;
- (void)setHasCellLteRSRQ:(BOOL)a3;
- (void)setHasCellModelConfidenceLevel:(BOOL)a3;
- (void)setHasCellModelVersion:(BOOL)a3;
- (void)setHasCellNrRSRP:(BOOL)a3;
- (void)setHasCellNrRSRQ:(BOOL)a3;
- (void)setHasCellNrSNR:(BOOL)a3;
- (void)setHasCellNsaEnabled:(BOOL)a3;
- (void)setHasCellRsrp:(BOOL)a3;
- (void)setHasCellSinr:(BOOL)a3;
- (void)setHasCmDataSentCount:(BOOL)a3;
- (void)setHasCmDataSentDuration:(BOOL)a3;
- (void)setHasCmEstimatedBandwidth:(BOOL)a3;
- (void)setHasColdStartType:(BOOL)a3;
- (void)setHasDecisionVIBE:(BOOL)a3;
- (void)setHasDecisionVO:(BOOL)a3;
- (void)setHasDeviation:(BOOL)a3;
- (void)setHasDevicePointOfInterest:(BOOL)a3;
- (void)setHasEstimatedHighBandwidth:(BOOL)a3;
- (void)setHasEstimatedLowBandwidth:(BOOL)a3;
- (void)setHasEstimatedSpeed:(BOOL)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasExpectedThroughputVIBE:(BOOL)a3;
- (void)setHasExpectedThroughputVO:(BOOL)a3;
- (void)setHasGoodDecisionsCounterVIBE:(BOOL)a3;
- (void)setHasGoodDecisionsCounterVO:(BOOL)a3;
- (void)setHasInvalidDecisionsCounterVIBE:(BOOL)a3;
- (void)setHasInvalidDecisionsCounterVO:(BOOL)a3;
- (void)setHasIsFR1:(BOOL)a3;
- (void)setHasIsWfiCaptive:(BOOL)a3;
- (void)setHasLqmScoreBT:(BOOL)a3;
- (void)setHasLqmScoreWifi:(BOOL)a3;
- (void)setHasLqmScorecellular:(BOOL)a3;
- (void)setHasLteMaxScheduledMimoLayersInACell:(BOOL)a3;
- (void)setHasMaxDLCAConfigured:(BOOL)a3;
- (void)setHasMaxOfActualLowBandwidth:(BOOL)a3;
- (void)setHasMaxULCAConfigured:(BOOL)a3;
- (void)setHasMlPredictedCellBW:(BOOL)a3;
- (void)setHasMlPredictedWiFiBW:(BOOL)a3;
- (void)setHasMovingAvgHighBandwidth:(BOOL)a3;
- (void)setHasMovingAvgLowBandwidth:(BOOL)a3;
- (void)setHasNrConfiguredBw:(BOOL)a3;
- (void)setHasNrMaxDlModulation:(BOOL)a3;
- (void)setHasNrTotalScheduledMimoLayers:(BOOL)a3;
- (void)setHasPActualLowBandwidth:(BOOL)a3;
- (void)setHasPacketLifetimeVIBE:(BOOL)a3;
- (void)setHasPacketLossRateVIBE:(BOOL)a3;
- (void)setHasPhyRate:(BOOL)a3;
- (void)setHasPkgLifeTimeVO:(BOOL)a3;
- (void)setHasPktLifeTimeVO:(BOOL)a3;
- (void)setHasPktLossRateVO:(BOOL)a3;
- (void)setHasQbssLoad:(BOOL)a3;
- (void)setHasRatioDupeBytes:(BOOL)a3;
- (void)setHasRatioOOBBytes:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasRxRetransmissionRate:(BOOL)a3;
- (void)setHasRxRetry:(BOOL)a3;
- (void)setHasTcpRTTAvg:(BOOL)a3;
- (void)setHasTcpRTTmin:(BOOL)a3;
- (void)setHasTcpRTTvar:(BOOL)a3;
- (void)setHasTotalConfiguredBw:(BOOL)a3;
- (void)setHasTotalConfiguredMimoLayers:(BOOL)a3;
- (void)setHasTxRetransmissionRate:(BOOL)a3;
- (void)setHasTxber:(BOOL)a3;
- (void)setHasVideoStreamingStallTime:(BOOL)a3;
- (void)setHasWeightedAveragePhyrateRx:(BOOL)a3;
- (void)setHasWeightedAveragePhyrateTx:(BOOL)a3;
- (void)setHasWeightedAverageRssi:(BOOL)a3;
- (void)setHasWeightedAverageSnr:(BOOL)a3;
- (void)setHasWifChannelBW:(BOOL)a3;
- (void)setHasWifChannelType:(BOOL)a3;
- (void)setHasWifiCapability:(BOOL)a3;
- (void)setHasWifiModelConfidenceLevel:(BOOL)a3;
- (void)setHasWifiModelVersion:(BOOL)a3;
- (void)setHasWifiRssi:(BOOL)a3;
- (void)setHasWifiSinr:(BOOL)a3;
- (void)setHasWifichannel:(BOOL)a3;
- (void)setHasWifiguardinterval:(BOOL)a3;
- (void)setHasWifilowDataMode:(BOOL)a3;
- (void)setHasWifimcsindex:(BOOL)a3;
- (void)setHasWifinumberOfSpatialStreams:(BOOL)a3;
- (void)setHasWrmRecommendedRAT:(BOOL)a3;
- (void)setInvalidDecisionsCounterVIBE:(unsigned int)a3;
- (void)setInvalidDecisionsCounterVO:(unsigned int)a3;
- (void)setIsFR1:(BOOL)a3;
- (void)setIsWfiCaptive:(int)a3;
- (void)setLqmScoreBT:(int)a3;
- (void)setLqmScoreWifi:(int)a3;
- (void)setLqmScorecellular:(int)a3;
- (void)setLteMaxScheduledMimoLayersInACell:(unsigned int)a3;
- (void)setMaxDLCAConfigured:(unsigned int)a3;
- (void)setMaxOfActualLowBandwidth:(unsigned int)a3;
- (void)setMaxULCAConfigured:(unsigned int)a3;
- (void)setMlPredictedCellBW:(unsigned int)a3;
- (void)setMlPredictedWiFiBW:(unsigned int)a3;
- (void)setMovingAvgHighBandwidth:(unsigned int)a3;
- (void)setMovingAvgLowBandwidth:(unsigned int)a3;
- (void)setNrConfiguredBw:(unsigned int)a3;
- (void)setNrMaxDlModulation:(unsigned int)a3;
- (void)setNrTotalScheduledMimoLayers:(unsigned int)a3;
- (void)setPActualLowBandwidth:(int)a3;
- (void)setPacketLifetimeVIBE:(unsigned int)a3;
- (void)setPacketLossRateVIBE:(unsigned int)a3;
- (void)setPhyRate:(unsigned int)a3;
- (void)setPkgLifeTimeVO:(unsigned int)a3;
- (void)setPktLifeTimeVO:(unsigned int)a3;
- (void)setPktLossRateVO:(unsigned int)a3;
- (void)setQbssLoad:(unsigned int)a3;
- (void)setRatType:(id)a3;
- (void)setRatioDupeBytes:(unsigned int)a3;
- (void)setRatioOOBBytes:(unsigned int)a3;
- (void)setRrcState:(unsigned int)a3;
- (void)setRxRetransmissionRate:(unsigned int)a3;
- (void)setRxRetry:(unsigned int)a3;
- (void)setTcpRTTAvg:(unsigned int)a3;
- (void)setTcpRTTmin:(unsigned int)a3;
- (void)setTcpRTTvar:(unsigned int)a3;
- (void)setTotalConfiguredBw:(unsigned int)a3;
- (void)setTotalConfiguredMimoLayers:(unsigned int)a3;
- (void)setTxRetransmissionRate:(unsigned int)a3;
- (void)setTxber:(unsigned int)a3;
- (void)setVideoStreamingStallTime:(unsigned int)a3;
- (void)setWeightedAveragePhyrateRx:(unsigned int)a3;
- (void)setWeightedAveragePhyrateTx:(unsigned int)a3;
- (void)setWeightedAverageRssi:(unsigned int)a3;
- (void)setWeightedAverageSnr:(unsigned int)a3;
- (void)setWifChannelBW:(unsigned int)a3;
- (void)setWifChannelType:(unsigned int)a3;
- (void)setWifiCapability:(unsigned int)a3;
- (void)setWifiModelConfidenceLevel:(unsigned int)a3;
- (void)setWifiModelVersion:(unsigned int)a3;
- (void)setWifiRssi:(int64_t)a3;
- (void)setWifiSinr:(int)a3;
- (void)setWifichannel:(int)a3;
- (void)setWifiguardinterval:(int)a3;
- (void)setWifilowDataMode:(int)a3;
- (void)setWifimcsindex:(int)a3;
- (void)setWifinumberOfSpatialStreams:(int)a3;
- (void)setWrmRecommendedRAT:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDThroughputEvaluation

- (void)dealloc
{
  [(AWDThroughputEvaluation *)self setRatType:0];
  [(AWDThroughputEvaluation *)self setAppType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDThroughputEvaluation;
  [(AWDThroughputEvaluation *)&v3 dealloc];
}

- (void)setEvent:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasEvent
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setBufferInterval:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_bufferInterval = a3;
}

- (void)setHasBufferInterval:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasBufferInterval
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setWifiRssi:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasWifiRssi
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyRate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_phyRate = a3;
}

- (void)setHasPhyRate:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPhyRate
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setQbssLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_qbssLoad = a3;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasQbssLoad
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setCca:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCca
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setBcnPer:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bcnPer = a3;
}

- (void)setHasBcnPer:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasBcnPer
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setExpectedThroughputVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_expectedThroughputVO = a3;
}

- (void)setHasExpectedThroughputVO:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasExpectedThroughputVO
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setWifiSinr:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x200000u;
  self->_wifiSinr = a3;
}

- (void)setHasWifiSinr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFDFFFFF | v3;
}

- (BOOL)hasWifiSinr
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 21) & 1;
}

- (void)setPktLifeTimeVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_pktLifeTimeVO = a3;
}

- (void)setHasPktLifeTimeVO:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPktLifeTimeVO
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setPktLossRateVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_pktLossRateVO = a3;
}

- (void)setHasPktLossRateVO:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPktLossRateVO
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setLqmScoreWifi:(int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_lqmScoreWifi = a3;
}

- (void)setHasLqmScoreWifi:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasLqmScoreWifi
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setPacketLossRateVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_packetLossRateVIBE = a3;
}

- (void)setHasPacketLossRateVIBE:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPacketLossRateVIBE
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setExpectedThroughputVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_expectedThroughputVIBE = a3;
}

- (void)setHasExpectedThroughputVIBE:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasExpectedThroughputVIBE
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setPacketLifetimeVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_packetLifetimeVIBE = a3;
}

- (void)setHasPacketLifetimeVIBE:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPacketLifetimeVIBE
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setBadDecisionsCounterVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_badDecisionsCounterVO = a3;
}

- (void)setHasBadDecisionsCounterVO:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasBadDecisionsCounterVO
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setGoodDecisionsCounterVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_goodDecisionsCounterVO = a3;
}

- (void)setHasGoodDecisionsCounterVO:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasGoodDecisionsCounterVO
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setInvalidDecisionsCounterVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_invalidDecisionsCounterVO = a3;
}

- (void)setHasInvalidDecisionsCounterVO:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasInvalidDecisionsCounterVO
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setBadDecisionsCounterVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_badDecisionsCounterVIBE = a3;
}

- (void)setHasBadDecisionsCounterVIBE:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasBadDecisionsCounterVIBE
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setGoodDecisionsCounterVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_goodDecisionsCounterVIBE = a3;
}

- (void)setHasGoodDecisionsCounterVIBE:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasGoodDecisionsCounterVIBE
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setInvalidDecisionsCounterVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_invalidDecisionsCounterVIBE = a3;
}

- (void)setHasInvalidDecisionsCounterVIBE:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasInvalidDecisionsCounterVIBE
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setLqmScorecellular:(int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_lqmScorecellular = a3;
}

- (void)setHasLqmScorecellular:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasLqmScorecellular
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (BOOL)hasRatType
{
  return self->_ratType != 0;
}

- (void)setCellRsrp:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_cellRsrp = a3;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasCellRsrp
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setCellSinr:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_cellSinr = a3;
}

- (void)setHasCellSinr:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasCellSinr
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setBtRssi:(int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_btRssi = a3;
}

- (void)setHasBtRssi:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasBtRssi
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setTxRetransmissionRate:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x200u;
  self->_txRetransmissionRate = a3;
}

- (void)setHasTxRetransmissionRate:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFDFF | v3;
}

- (BOOL)hasTxRetransmissionRate
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 9) & 1;
}

- (void)setRxRetransmissionRate:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 4u;
  self->_rxRetransmissionRate = a3;
}

- (void)setHasRxRetransmissionRate:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFB | v3;
}

- (BOOL)hasRxRetransmissionRate
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 2) & 1;
}

- (void)setLqmScoreBT:(int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_lqmScoreBT = a3;
}

- (void)setHasLqmScoreBT:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasLqmScoreBT
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setWrmRecommendedRAT:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x8000000u;
  self->_wrmRecommendedRAT = a3;
}

- (void)setHasWrmRecommendedRAT:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xF7FFFFFF | v3;
}

- (BOOL)hasWrmRecommendedRAT
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 27) & 1;
}

- (void)setActualLowBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_actualLowBandwidth = a3;
}

- (void)setHasActualLowBandwidth:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasActualLowBandwidth
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setActualHighBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_actualHighBandwidth = a3;
}

- (void)setHasActualHighBandwidth:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasActualHighBandwidth
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setEstimatedLowBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_estimatedLowBandwidth = a3;
}

- (void)setHasEstimatedLowBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasEstimatedLowBandwidth
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setEstimatedHighBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_estimatedHighBandwidth = a3;
}

- (void)setHasEstimatedHighBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasEstimatedHighBandwidth
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setMovingAvgLowBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_movingAvgLowBandwidth = a3;
}

- (void)setHasMovingAvgLowBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMovingAvgLowBandwidth
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setMovingAvgHighBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_movingAvgHighBandwidth = a3;
}

- (void)setHasMovingAvgHighBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMovingAvgHighBandwidth
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setDeviation:(int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_deviation = a3;
}

- (void)setHasDeviation:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasDeviation
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setMaxOfActualLowBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_maxOfActualLowBandwidth = a3;
}

- (void)setHasMaxOfActualLowBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxOfActualLowBandwidth
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setPkgLifeTimeVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_pkgLifeTimeVO = a3;
}

- (void)setHasPkgLifeTimeVO:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPkgLifeTimeVO
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setDecisionVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_decisionVO = a3;
}

- (void)setHasDecisionVO:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasDecisionVO
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setDecisionVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_decisionVIBE = a3;
}

- (void)setHasDecisionVIBE:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasDecisionVIBE
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setVideoStreamingStallTime:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x800u;
  self->_videoStreamingStallTime = a3;
}

- (void)setHasVideoStreamingStallTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFF7FF | v3;
}

- (BOOL)hasVideoStreamingStallTime
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 11) & 1;
}

- (void)setTxber:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x400u;
  self->_txber = a3;
}

- (void)setHasTxber:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFBFF | v3;
}

- (BOOL)hasTxber
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 10) & 1;
}

- (void)setRxRetry:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 8u;
  self->_rxRetry = a3;
}

- (void)setHasRxRetry:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFF7 | v3;
}

- (BOOL)hasRxRetry
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 3) & 1;
}

- (void)setWeightedAveragePhyrateTx:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x2000u;
  self->_weightedAveragePhyrateTx = a3;
}

- (void)setHasWeightedAveragePhyrateTx:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFDFFF | v3;
}

- (BOOL)hasWeightedAveragePhyrateTx
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 13) & 1;
}

- (void)setWeightedAveragePhyrateRx:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x1000u;
  self->_weightedAveragePhyrateRx = a3;
}

- (void)setHasWeightedAveragePhyrateRx:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFEFFF | v3;
}

- (BOOL)hasWeightedAveragePhyrateRx
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 12) & 1;
}

- (void)setWeightedAverageRssi:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x4000u;
  self->_weightedAverageRssi = a3;
}

- (void)setHasWeightedAverageRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFBFFF | v3;
}

- (BOOL)hasWeightedAverageRssi
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 14) & 1;
}

- (void)setWeightedAverageSnr:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x8000u;
  self->_weightedAverageSnr = a3;
}

- (void)setHasWeightedAverageSnr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFF7FFF | v3;
}

- (BOOL)hasWeightedAverageSnr
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 15) & 1;
}

- (void)setCmDataSentCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_cmDataSentCount = a3;
}

- (void)setHasCmDataSentCount:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasCmDataSentCount
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setCmDataSentDuration:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_cmDataSentDuration = a3;
}

- (void)setHasCmDataSentDuration:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasCmDataSentDuration
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setCmEstimatedBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_cmEstimatedBandwidth = a3;
}

- (void)setHasCmEstimatedBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasCmEstimatedBandwidth
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setDevicePointOfInterest:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_devicePointOfInterest = a3;
}

- (void)setHasDevicePointOfInterest:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasDevicePointOfInterest
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setRrcState:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 2u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFD | v3;
}

- (BOOL)hasRrcState
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 1) & 1;
}

- (void)setMlPredictedWiFiBW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_mlPredictedWiFiBW = a3;
}

- (void)setHasMlPredictedWiFiBW:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMlPredictedWiFiBW
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setWifiModelVersion:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x100000u;
  self->_wifiModelVersion = a3;
}

- (void)setHasWifiModelVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFEFFFFF | v3;
}

- (BOOL)hasWifiModelVersion
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 20) & 1;
}

- (void)setWifiModelConfidenceLevel:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x80000u;
  self->_wifiModelConfidenceLevel = a3;
}

- (void)setHasWifiModelConfidenceLevel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFF7FFFF | v3;
}

- (BOOL)hasWifiModelConfidenceLevel
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 19) & 1;
}

- (void)setMlPredictedCellBW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_mlPredictedCellBW = a3;
}

- (void)setHasMlPredictedCellBW:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMlPredictedCellBW
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setCellModelVersion:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_cellModelVersion = a3;
}

- (void)setHasCellModelVersion:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasCellModelVersion
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setCellModelConfidenceLevel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_cellModelConfidenceLevel = a3;
}

- (void)setHasCellModelConfidenceLevel:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasCellModelConfidenceLevel
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setCellEstimatedBW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_cellEstimatedBW = a3;
}

- (void)setHasCellEstimatedBW:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasCellEstimatedBW
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (BOOL)hasAppType
{
  return self->_appType != 0;
}

- (void)setTcpRTTAvg:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10u;
  self->_tcpRTTAvg = a3;
}

- (void)setHasTcpRTTAvg:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFEF | v3;
}

- (BOOL)hasTcpRTTAvg
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 4) & 1;
}

- (void)setTcpRTTmin:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20u;
  self->_tcpRTTmin = a3;
}

- (void)setHasTcpRTTmin:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFDF | v3;
}

- (BOOL)hasTcpRTTmin
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 5) & 1;
}

- (void)setTcpRTTvar:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x40u;
  self->_tcpRTTvar = a3;
}

- (void)setHasTcpRTTvar:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFBF | v3;
}

- (BOOL)hasTcpRTTvar
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 6) & 1;
}

- (void)setRatioDupeBytes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_ratioDupeBytes = a3;
}

- (void)setHasRatioDupeBytes:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasRatioDupeBytes
{
  return *(void *)&self->_has >> 63;
}

- (void)setRatioOOBBytes:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 1u;
  self->_ratioOOBBytes = a3;
}

- (void)setHasRatioOOBBytes:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFFFE | a3;
}

- (BOOL)hasRatioOOBBytes
{
  return *((_DWORD *)&self->_has + 2) & 1;
}

- (void)setCellARFCN:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cellARFCN = a3;
}

- (void)setHasCellARFCN:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCellARFCN
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setCellChannelBW:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_cellChannelBW = a3;
}

- (void)setHasCellChannelBW:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasCellChannelBW
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setCellBandInfo:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_cellBandInfo = a3;
}

- (void)setHasCellBandInfo:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasCellBandInfo
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setMaxDLCAConfigured:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_maxDLCAConfigured = a3;
}

- (void)setHasMaxDLCAConfigured:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxDLCAConfigured
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setMaxULCAConfigured:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_maxULCAConfigured = a3;
}

- (void)setHasMaxULCAConfigured:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxULCAConfigured
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setWifChannelBW:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10000u;
  self->_wifChannelBW = a3;
}

- (void)setHasWifChannelBW:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFEFFFF | v3;
}

- (BOOL)hasWifChannelBW
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 16) & 1;
}

- (void)setWifChannelType:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20000u;
  self->_wifChannelType = a3;
}

- (void)setHasWifChannelType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFDFFFF | v3;
}

- (BOOL)hasWifChannelType
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 17) & 1;
}

- (void)setWifiCapability:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x40000u;
  self->_wifiCapability = a3;
}

- (void)setHasWifiCapability:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFBFFFF | v3;
}

- (BOOL)hasWifiCapability
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 18) & 1;
}

- (void)setEstimatedSpeed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_estimatedSpeed = a3;
}

- (void)setHasEstimatedSpeed:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasEstimatedSpeed
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setCellNsaEnabled:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x10000000u;
  self->_cellNsaEnabled = a3;
}

- (void)setHasCellNsaEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xEFFFFFFF | v3;
}

- (BOOL)hasCellNsaEnabled
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 28) & 1;
}

- (void)setIsFR1:(BOOL)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x20000000u;
  self->_isFR1 = a3;
}

- (void)setHasIsFR1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xDFFFFFFF | v3;
}

- (BOOL)hasIsFR1
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 29) & 1;
}

- (void)setCellNrRSRP:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_cellNrRSRP = a3;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasCellNrRSRP
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setCellNrRSRQ:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_cellNrRSRQ = a3;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasCellNrRSRQ
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setCellNrSNR:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_cellNrSNR = a3;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasCellNrSNR
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setCellLteRSRQ:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_cellLteRSRQ = a3;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasCellLteRSRQ
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setPActualLowBandwidth:(int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_pActualLowBandwidth = a3;
}

- (void)setHasPActualLowBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPActualLowBandwidth
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setWifimcsindex:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x2000000u;
  self->_wifimcsindex = a3;
}

- (void)setHasWifimcsindex:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFDFFFFFF | v3;
}

- (BOOL)hasWifimcsindex
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 25) & 1;
}

- (void)setWifiguardinterval:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x800000u;
  self->_wifiguardinterval = a3;
}

- (void)setHasWifiguardinterval:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFF7FFFFF | v3;
}

- (BOOL)hasWifiguardinterval
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 23) & 1;
}

- (void)setWifinumberOfSpatialStreams:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x4000000u;
  self->_wifinumberOfSpatialStreams = a3;
}

- (void)setHasWifinumberOfSpatialStreams:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFBFFFFFF | v3;
}

- (BOOL)hasWifinumberOfSpatialStreams
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 26) & 1;
}

- (void)setWifichannel:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x400000u;
  self->_wifichannel = a3;
}

- (void)setHasWifichannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFBFFFFF | v3;
}

- (BOOL)hasWifichannel
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 22) & 1;
}

- (void)setWifilowDataMode:(int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x1000000u;
  self->_wifilowDataMode = a3;
}

- (void)setHasWifilowDataMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFEFFFFFF | v3;
}

- (BOOL)hasWifilowDataMode
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 24) & 1;
}

- (void)setIsWfiCaptive:(int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_isWfiCaptive = a3;
}

- (void)setHasIsWfiCaptive:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsWfiCaptive
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setBtWiFiCoexState:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_btWiFiCoexState = a3;
}

- (void)setHasBtWiFiCoexState:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasBtWiFiCoexState
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setTotalConfiguredBw:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x80u;
  self->_totalConfiguredBw = a3;
}

- (void)setHasTotalConfiguredBw:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFF7F | v3;
}

- (BOOL)hasTotalConfiguredBw
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 7) & 1;
}

- (void)setNrConfiguredBw:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_nrConfiguredBw = a3;
}

- (void)setHasNrConfiguredBw:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNrConfiguredBw
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setNrTotalScheduledMimoLayers:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_nrTotalScheduledMimoLayers = a3;
}

- (void)setHasNrTotalScheduledMimoLayers:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNrTotalScheduledMimoLayers
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (void)setTotalConfiguredMimoLayers:(unsigned int)a3
{
  *((_DWORD *)&self->_has + 2) |= 0x100u;
  self->_totalConfiguredMimoLayers = a3;
}

- (void)setHasTotalConfiguredMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)&self->_has + 2) = *((_DWORD *)&self->_has + 2) & 0xFFFFFEFF | v3;
}

- (BOOL)hasTotalConfiguredMimoLayers
{
  return ((unint64_t)*((unsigned int *)&self->_has + 2) >> 8) & 1;
}

- (void)setLteMaxScheduledMimoLayersInACell:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_lteMaxScheduledMimoLayersInACell = a3;
}

- (void)setHasLteMaxScheduledMimoLayersInACell:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLteMaxScheduledMimoLayersInACell
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setNrMaxDlModulation:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_nrMaxDlModulation = a3;
}

- (void)setHasNrMaxDlModulation:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNrMaxDlModulation
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (void)setColdStartType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_coldStartType = a3;
}

- (void)setHasColdStartType:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasColdStartType
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDThroughputEvaluation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDThroughputEvaluation description](&v3, sel_description), -[AWDThroughputEvaluation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_event] forKey:@"event"];
    uint64_t has = (uint64_t)self->_has;
  }
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bufferInterval] forKey:@"buffer_interval"];
    uint64_t has = (uint64_t)self->_has;
    int v5 = *((_DWORD *)&self->_has + 2);
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_73;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiRssi] forKey:@"wifi_rssi"];
  uint64_t has = (uint64_t)self->_has;
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phyRate] forKey:@"phy_rate"];
  uint64_t has = (uint64_t)self->_has;
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_qbssLoad] forKey:@"qbss_load"];
  uint64_t has = (uint64_t)self->_has;
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cca] forKey:@"cca"];
  uint64_t has = (uint64_t)self->_has;
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bcnPer] forKey:@"bcnPer"];
  uint64_t has = (uint64_t)self->_has;
  int v5 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_expectedThroughputVO] forKey:@"expectedThroughputVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x200000) == 0)
  {
LABEL_11:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithInt:self->_wifiSinr] forKey:@"wifiSinr"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_12:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pktLifeTimeVO] forKey:@"pktLifeTimeVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pktLossRateVO] forKey:@"pktLossRateVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithInt:self->_lqmScoreWifi] forKey:@"lqmScoreWifi"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x400000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_packetLossRateVIBE] forKey:@"packetLossRateVI_BE"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_16:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_expectedThroughputVIBE] forKey:@"expectedThroughputVI_BE"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_packetLifetimeVIBE] forKey:@"packetLifetimeVI_BE"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_badDecisionsCounterVO] forKey:@"badDecisionsCounterVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_goodDecisionsCounterVO] forKey:@"goodDecisionsCounterVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_20:
    if ((has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_invalidDecisionsCounterVO] forKey:@"invalidDecisionsCounterVO"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_21:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_89;
  }
LABEL_88:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_badDecisionsCounterVIBE] forKey:@"badDecisionsCounterVI_BE"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_goodDecisionsCounterVIBE] forKey:@"goodDecisionsCounterVI_BE"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_invalidDecisionsCounterVIBE] forKey:@"invalidDecisionsCounterVI_BE"];
  if ((*(void *)&self->_has & 0x80000000000) != 0) {
LABEL_24:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_lqmScorecellular] forKey:@"lqmScorecellular"];
LABEL_25:
  ratType = self->_ratType;
  if (ratType) {
    [v3 setObject:ratType forKey:@"ratType"];
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x100000) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_cellRsrp] forKey:@"cellRsrp"];
    uint64_t v7 = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x200000) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_cellSinr] forKey:@"cellSinr"];
    uint64_t v7 = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((v7 & 0x40) == 0)
    {
LABEL_31:
      if ((v8 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_94;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_btRssi] forKey:@"btRssi"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x200) == 0)
  {
LABEL_32:
    if ((v8 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txRetransmissionRate] forKey:@"txRetransmissionRate"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxRetransmissionRate] forKey:@"rxRetransmissionRate"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithInt:self->_lqmScoreBT] forKey:@"lqmScoreBT"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_35:
    if ((v7 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wrmRecommendedRAT] forKey:@"wrm_recommended_RAT"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 4) == 0)
  {
LABEL_36:
    if ((v7 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_actualLowBandwidth] forKey:@"actual_low_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 2) == 0)
  {
LABEL_37:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_100;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_actualHighBandwidth] forKey:@"actual_high_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_101;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_estimatedLowBandwidth] forKey:@"estimated_low_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_102;
  }
LABEL_101:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_estimatedHighBandwidth] forKey:@"estimated_high_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_movingAvgLowBandwidth] forKey:@"moving_avg_low_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_104;
  }
LABEL_103:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_movingAvgHighBandwidth] forKey:@"moving_avg_high_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_105;
  }
LABEL_104:
  [v3 setObject:[NSNumber numberWithInt:self->_deviation] forKey:@"deviation"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_106;
  }
LABEL_105:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_maxOfActualLowBandwidth] forKey:@"max_of_actual_low_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pkgLifeTimeVO] forKey:@"pkgLifeTimeVO"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_decisionVO] forKey:@"decisionVO"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x800) == 0) {
      goto LABEL_47;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_decisionVIBE] forKey:@"decisionVIBE"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x800) == 0)
  {
LABEL_47:
    if ((v8 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_videoStreamingStallTime] forKey:@"videoStreamingStallTime"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x400) == 0)
  {
LABEL_48:
    if ((v8 & 8) == 0) {
      goto LABEL_49;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txber] forKey:@"txber"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 8) == 0)
  {
LABEL_49:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_112;
  }
LABEL_111:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxRetry] forKey:@"rx_retry"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000) == 0)
  {
LABEL_50:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_113;
  }
LABEL_112:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_weightedAveragePhyrateTx] forKey:@"weighted_average_phyrate_tx"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000) == 0)
  {
LABEL_51:
    if ((v8 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_114;
  }
LABEL_113:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_weightedAveragePhyrateRx] forKey:@"weighted_average_phyrate_rx"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x4000) == 0)
  {
LABEL_52:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_115;
  }
LABEL_114:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_weightedAverageRssi] forKey:@"weighted_average_rssi"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000) == 0)
  {
LABEL_53:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_116;
  }
LABEL_115:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_weightedAverageSnr] forKey:@"weighted_average_snr"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_117;
  }
LABEL_116:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cmDataSentCount] forKey:@"cm_data_sent_count"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000) == 0)
  {
LABEL_55:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_118;
  }
LABEL_117:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cmDataSentDuration] forKey:@"cm_data_sent_duration"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_119;
  }
LABEL_118:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cmEstimatedBandwidth] forKey:@"cm_estimated_bandwidth"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_57:
    if ((v8 & 2) == 0) {
      goto LABEL_58;
    }
    goto LABEL_120;
  }
LABEL_119:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_devicePointOfInterest] forKey:@"device_point_of_interest"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 2) == 0)
  {
LABEL_58:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_121;
  }
LABEL_120:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rrcState] forKey:@"rrcState"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_59:
    if ((v8 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_122;
  }
LABEL_121:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mlPredictedWiFiBW] forKey:@"mlPredictedWiFiBW"];
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x100000) == 0)
  {
LABEL_60:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_123;
  }
LABEL_122:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiModelVersion] forKey:@"wifiModelVersion"];
  uint64_t v7 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x80000) == 0)
  {
LABEL_61:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_124;
  }
LABEL_123:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiModelConfidenceLevel] forKey:@"wifiModelConfidenceLevel"];
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_125;
  }
LABEL_124:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mlPredictedCellBW] forKey:@"mlPredictedCellBW"];
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000) == 0)
  {
LABEL_63:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_126;
  }
LABEL_125:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellModelVersion] forKey:@"cellModelVersion"];
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x8000) == 0)
  {
LABEL_64:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_126:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellModelConfidenceLevel] forKey:@"cellModelConfidenceLevel"];
  if ((*(void *)&self->_has & 0x2000) != 0) {
LABEL_65:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellEstimatedBW] forKey:@"cellEstimatedBW"];
LABEL_66:
  appType = self->_appType;
  if (appType) {
    [v3 setObject:appType forKey:@"appType"];
  }
  p_uint64_t has = &self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpRTTAvg] forKey:@"tcpRTTAvg"];
    uint64_t v12 = *(void *)p_has;
    int v11 = *((_DWORD *)&self->_has + 2);
    if ((v11 & 0x20) == 0) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
  uint64_t v12 = *(void *)p_has;
  if ((v11 & 0x20) != 0)
  {
LABEL_129:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpRTTmin] forKey:@"tcpRTTmin"];
    uint64_t v12 = (uint64_t)self->_has;
    int v11 = *((_DWORD *)&self->_has + 2);
  }
LABEL_130:
  if ((v11 & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tcpRTTvar] forKey:@"tcpRTTvar"];
    uint64_t v12 = (uint64_t)self->_has;
    int v11 = *((_DWORD *)&self->_has + 2);
    if ((v12 & 0x8000000000000000) == 0)
    {
LABEL_132:
      if ((v11 & 1) == 0) {
        goto LABEL_133;
      }
      goto LABEL_167;
    }
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    goto LABEL_132;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ratioDupeBytes] forKey:@"ratioDupeBytes"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 1) == 0)
  {
LABEL_133:
    if ((v12 & 0x400) == 0) {
      goto LABEL_134;
    }
    goto LABEL_168;
  }
LABEL_167:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ratioOOBBytes] forKey:@"ratioOOBBytes"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x400) == 0)
  {
LABEL_134:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_169;
  }
LABEL_168:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellARFCN] forKey:@"cellARFCN"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x1000) == 0)
  {
LABEL_135:
    if ((v12 & 0x800) == 0) {
      goto LABEL_136;
    }
    goto LABEL_170;
  }
LABEL_169:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellChannelBW] forKey:@"cellChannelBW"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x800) == 0)
  {
LABEL_136:
    if ((v12 & 0x200000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_171;
  }
LABEL_170:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellBandInfo] forKey:@"cellBandInfo"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x200000000000) == 0)
  {
LABEL_137:
    if ((v12 & 0x800000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_172;
  }
LABEL_171:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_maxDLCAConfigured] forKey:@"maxDLCAConfigured"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_138:
    if ((v11 & 0x10000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_173;
  }
LABEL_172:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_maxULCAConfigured] forKey:@"maxULCAConfigured"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000) == 0)
  {
LABEL_139:
    if ((v11 & 0x20000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_174;
  }
LABEL_173:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifChannelBW] forKey:@"wifChannelBW"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x20000) == 0)
  {
LABEL_140:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_175;
  }
LABEL_174:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifChannelType] forKey:@"wifChannelType"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x40000) == 0)
  {
LABEL_141:
    if ((v12 & 0x100000000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_176;
  }
LABEL_175:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiCapability] forKey:@"wifiCapability"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x100000000) == 0)
  {
LABEL_142:
    if ((v11 & 0x10000000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_177;
  }
LABEL_176:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_estimatedSpeed] forKey:@"estimatedSpeed"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000000) == 0)
  {
LABEL_143:
    if ((v11 & 0x20000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_178;
  }
LABEL_177:
  [v3 setObject:[NSNumber numberWithBool:self->_cellNsaEnabled] forKey:@"cellNsaEnabled"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_144:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_179;
  }
LABEL_178:
  [v3 setObject:[NSNumber numberWithBool:self->_isFR1] forKey:@"isFR1"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x20000) == 0)
  {
LABEL_145:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_180;
  }
LABEL_179:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrRSRP] forKey:@"cellNrRSRP"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x40000) == 0)
  {
LABEL_146:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_181;
  }
LABEL_180:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrRSRQ] forKey:@"cellNrRSRQ"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80000) == 0)
  {
LABEL_147:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_182;
  }
LABEL_181:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrSNR] forKey:@"cellNrSNR"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x4000) == 0)
  {
LABEL_148:
    if ((v12 & 0x80000000000000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_183;
  }
LABEL_182:
  [v3 setObject:[NSNumber numberWithInt:self->_cellLteRSRQ] forKey:@"cellLteRSRQ"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80000000000000) == 0)
  {
LABEL_149:
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_184;
  }
LABEL_183:
  [v3 setObject:[NSNumber numberWithInt:self->_pActualLowBandwidth] forKey:@"pActualLowBandwidth"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_150:
    if ((v11 & 0x800000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_185;
  }
LABEL_184:
  [v3 setObject:[NSNumber numberWithInt:self->_wifimcsindex] forKey:@"wifimcsindex"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800000) == 0)
  {
LABEL_151:
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_186;
  }
LABEL_185:
  [v3 setObject:[NSNumber numberWithInt:self->_wifiguardinterval] forKey:@"wifiguardinterval"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_152:
    if ((v11 & 0x400000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_187;
  }
LABEL_186:
  [v3 setObject:[NSNumber numberWithInt:self->_wifinumberOfSpatialStreams] forKey:@"wifinumberOfSpatialStreams"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x400000) == 0)
  {
LABEL_153:
    if ((v11 & 0x1000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_188;
  }
LABEL_187:
  [v3 setObject:[NSNumber numberWithInt:self->_wifichannel] forKey:@"wifichannel"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_154:
    if ((v12 & 0x10000000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_189;
  }
LABEL_188:
  [v3 setObject:[NSNumber numberWithInt:self->_wifilowDataMode] forKey:@"wifilowDataMode"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10000000000) == 0)
  {
LABEL_155:
    if ((v12 & 0x80) == 0) {
      goto LABEL_156;
    }
    goto LABEL_190;
  }
LABEL_189:
  [v3 setObject:[NSNumber numberWithInt:self->_isWfiCaptive] forKey:@"isWfiCaptive"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80) == 0)
  {
LABEL_156:
    if ((v11 & 0x80) == 0) {
      goto LABEL_157;
    }
    goto LABEL_191;
  }
LABEL_190:
  [v3 setObject:[NSNumber numberWithInt:self->_btWiFiCoexState] forKey:@"btWiFiCoexState"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80) == 0)
  {
LABEL_157:
    if ((v12 & 0x10000000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_192;
  }
LABEL_191:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalConfiguredBw] forKey:@"total_configured_bw"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10000000000000) == 0)
  {
LABEL_158:
    if ((v12 & 0x40000000000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_193;
  }
LABEL_192:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nrConfiguredBw] forKey:@"nr_configured_bw"];
  uint64_t v12 = (uint64_t)self->_has;
  int v11 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x40000000000000) == 0)
  {
LABEL_159:
    if ((v11 & 0x100) == 0) {
      goto LABEL_160;
    }
    goto LABEL_194;
  }
LABEL_193:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nrTotalScheduledMimoLayers] forKey:@"nr_total_scheduled_mimo_layers"];
  uint64_t v12 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_160:
    if ((v12 & 0x100000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_195;
  }
LABEL_194:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalConfiguredMimoLayers] forKey:@"total_configured_mimo_layers"];
  uint64_t v12 = (uint64_t)self->_has;
  if ((v12 & 0x100000000000) == 0)
  {
LABEL_161:
    if ((v12 & 0x20000000000000) == 0) {
      goto LABEL_162;
    }
LABEL_196:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nrMaxDlModulation] forKey:@"nr_max_dl_modulation"];
    if ((*(void *)&self->_has & 0x2000000) == 0) {
      return v3;
    }
    goto LABEL_163;
  }
LABEL_195:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lteMaxScheduledMimoLayersInACell] forKey:@"lte_max_scheduled_mimo_layers_in_a_cell"];
  uint64_t v12 = (uint64_t)self->_has;
  if ((v12 & 0x20000000000000) != 0) {
    goto LABEL_196;
  }
LABEL_162:
  if ((v12 & 0x2000000) != 0) {
LABEL_163:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coldStartType] forKey:@"cold_start_type"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDThroughputEvaluationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t has = *(void *)p_has;
  }
  int v6 = *((_DWORD *)p_has + 2);
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t has = (uint64_t)self->_has;
    int v6 = *((_DWORD *)&self->_has + 2);
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_73;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteSint64Field();
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x200000) == 0)
  {
LABEL_11:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteSint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_12:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x400000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_16:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_20:
    if ((has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_21:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x80000000000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteInt32Field();
LABEL_25:
  if (self->_ratType) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x100000) != 0)
  {
    PBDataWriterWriteSint32Field();
    uint64_t v7 = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x200000) != 0)
  {
    PBDataWriterWriteSint32Field();
    uint64_t v7 = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((v7 & 0x40) == 0)
    {
LABEL_31:
      if ((v8 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_94;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteSint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x200) == 0)
  {
LABEL_32:
    if ((v8 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteSint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_35:
    if ((v7 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 4) == 0)
  {
LABEL_36:
    if ((v7 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 2) == 0)
  {
LABEL_37:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteSint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x800) == 0) {
      goto LABEL_47;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x800) == 0)
  {
LABEL_47:
    if ((v8 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x400) == 0)
  {
LABEL_48:
    if ((v8 & 8) == 0) {
      goto LABEL_49;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 8) == 0)
  {
LABEL_49:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000) == 0)
  {
LABEL_50:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000) == 0)
  {
LABEL_51:
    if ((v8 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x4000) == 0)
  {
LABEL_52:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000) == 0)
  {
LABEL_53:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000) == 0)
  {
LABEL_55:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_57:
    if ((v8 & 2) == 0) {
      goto LABEL_58;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 2) == 0)
  {
LABEL_58:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_59:
    if ((v8 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x100000) == 0)
  {
LABEL_60:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x80000) == 0)
  {
LABEL_61:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000) == 0)
  {
LABEL_63:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x8000) == 0)
  {
LABEL_64:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_126:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x2000) != 0) {
LABEL_65:
  }
    PBDataWriterWriteUint32Field();
LABEL_66:
  if (self->_appType) {
    PBDataWriterWriteStringField();
  }
  v9 = &self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v11 = *(void *)v9;
    int v10 = *((_DWORD *)&self->_has + 2);
    if ((v10 & 0x20) == 0) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
  uint64_t v11 = *(void *)v9;
  if ((v10 & 0x20) != 0)
  {
LABEL_129:
    PBDataWriterWriteUint32Field();
    uint64_t v11 = (uint64_t)self->_has;
    int v10 = *((_DWORD *)&self->_has + 2);
  }
LABEL_130:
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v11 = (uint64_t)self->_has;
    int v10 = *((_DWORD *)&self->_has + 2);
    if ((v11 & 0x8000000000000000) == 0)
    {
LABEL_132:
      if ((v10 & 1) == 0) {
        goto LABEL_133;
      }
      goto LABEL_166;
    }
  }
  else if ((v11 & 0x8000000000000000) == 0)
  {
    goto LABEL_132;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 1) == 0)
  {
LABEL_133:
    if ((v11 & 0x400) == 0) {
      goto LABEL_134;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x400) == 0)
  {
LABEL_134:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x1000) == 0)
  {
LABEL_135:
    if ((v11 & 0x800) == 0) {
      goto LABEL_136;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800) == 0)
  {
LABEL_136:
    if ((v11 & 0x200000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_137:
    if ((v11 & 0x800000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800000000000) == 0)
  {
LABEL_138:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10000) == 0)
  {
LABEL_139:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x20000) == 0)
  {
LABEL_140:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x40000) == 0)
  {
LABEL_141:
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_142:
    if ((v10 & 0x10000000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_143:
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_144:
    if ((v11 & 0x20000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x20000) == 0)
  {
LABEL_145:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x40000) == 0)
  {
LABEL_146:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80000) == 0)
  {
LABEL_147:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x4000) == 0)
  {
LABEL_148:
    if ((v11 & 0x80000000000000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_149:
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_150:
    if ((v10 & 0x800000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x800000) == 0)
  {
LABEL_151:
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_152:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x400000) == 0)
  {
LABEL_153:
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_154:
    if ((v11 & 0x10000000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_155:
    if ((v11 & 0x80) == 0) {
      goto LABEL_156;
    }
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80) == 0)
  {
LABEL_156:
    if ((v10 & 0x80) == 0) {
      goto LABEL_157;
    }
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteInt32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x80) == 0)
  {
LABEL_157:
    if ((v11 & 0x10000000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000000000000) == 0)
  {
LABEL_158:
    if ((v11 & 0x40000000000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x40000000000000) == 0)
  {
LABEL_159:
    if ((v10 & 0x100) == 0) {
      goto LABEL_160;
    }
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_160:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_161:
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_162;
    }
LABEL_195:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_has & 0x2000000) == 0) {
      return;
    }
    goto LABEL_196;
  }
LABEL_194:
  PBDataWriterWriteUint32Field();
  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x20000000000000) != 0) {
    goto LABEL_195;
  }
LABEL_162:
  if ((v11 & 0x2000000) == 0) {
    return;
  }
LABEL_196:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000) != 0)
  {
    *((_DWORD *)a3 + 38) = self->_event;
    *((void *)a3 + 50) |= 0x200000000uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_bufferInterval;
    *((void *)a3 + 50) |= 0x100uLL;
    uint64_t has = (uint64_t)self->_has;
    int v6 = *((_DWORD *)&self->_has + 2);
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_73;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)a3 + 1) = self->_wifiRssi;
  *((void *)a3 + 50) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 63) = self->_phyRate;
  *((void *)a3 + 50) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 67) = self->_qbssLoad;
  *((void *)a3 + 50) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 14) = self->_cca;
  *((void *)a3 + 50) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 10) = self->_bcnPer;
  *((void *)a3 + 50) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  int v6 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 40) = self->_expectedThroughputVO;
  *((void *)a3 + 50) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x200000) == 0)
  {
LABEL_11:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 92) = self->_wifiSinr;
  *((_DWORD *)a3 + 102) |= 0x200000u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_12:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 65) = self->_pktLifeTimeVO;
  *((void *)a3 + 50) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 66) = self->_pktLossRateVO;
  *((void *)a3 + 50) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 47) = self->_lqmScoreWifi;
  *((void *)a3 + 50) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x400000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 62) = self->_packetLossRateVIBE;
  *((void *)a3 + 50) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_16:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)a3 + 39) = self->_expectedThroughputVIBE;
  *((void *)a3 + 50) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)a3 + 61) = self->_packetLifetimeVIBE;
  *((void *)a3 + 50) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)a3 + 9) = self->_badDecisionsCounterVO;
  *((void *)a3 + 50) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)a3 + 42) = self->_goodDecisionsCounterVO;
  *((void *)a3 + 50) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_20:
    if ((has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 44) = self->_invalidDecisionsCounterVO;
  *((void *)a3 + 50) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_21:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 8) = self->_badDecisionsCounterVIBE;
  *((void *)a3 + 50) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 41) = self->_goodDecisionsCounterVIBE;
  *((void *)a3 + 50) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_90:
  *((_DWORD *)a3 + 43) = self->_invalidDecisionsCounterVIBE;
  *((void *)a3 + 50) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x80000000000) != 0)
  {
LABEL_24:
    *((_DWORD *)a3 + 48) = self->_lqmScorecellular;
    *((void *)a3 + 50) |= 0x80000000000uLL;
  }
LABEL_25:
  if (self->_ratType) {
    [a3 setRatType:];
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x100000) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_cellRsrp;
    *((void *)a3 + 50) |= 0x100000uLL;
    uint64_t v7 = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x200000) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_cellSinr;
    *((void *)a3 + 50) |= 0x200000uLL;
    uint64_t v7 = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((v7 & 0x40) == 0)
    {
LABEL_31:
      if ((v8 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_94;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  *((_DWORD *)a3 + 11) = self->_btRssi;
  *((void *)a3 + 50) |= 0x40uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x200) == 0)
  {
LABEL_32:
    if ((v8 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)a3 + 80) = self->_txRetransmissionRate;
  *((_DWORD *)a3 + 102) |= 0x200u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 73) = self->_rxRetransmissionRate;
  *((_DWORD *)a3 + 102) |= 4u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 46) = self->_lqmScoreBT;
  *((void *)a3 + 50) |= 0x20000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_35:
    if ((v7 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 98) = self->_wrmRecommendedRAT;
  *((_DWORD *)a3 + 102) |= 0x8000000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 4) == 0)
  {
LABEL_36:
    if ((v7 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 5) = self->_actualLowBandwidth;
  *((void *)a3 + 50) |= 4uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 2) == 0)
  {
LABEL_37:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 4) = self->_actualHighBandwidth;
  *((void *)a3 + 50) |= 2uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 36) = self->_estimatedLowBandwidth;
  *((void *)a3 + 50) |= 0x80000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 35) = self->_estimatedHighBandwidth;
  *((void *)a3 + 50) |= 0x40000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)a3 + 56) = self->_movingAvgLowBandwidth;
  *((void *)a3 + 50) |= 0x8000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)a3 + 55) = self->_movingAvgHighBandwidth;
  *((void *)a3 + 50) |= 0x4000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)a3 + 33) = self->_deviation;
  *((void *)a3 + 50) |= 0x10000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 51) = self->_maxOfActualLowBandwidth;
  *((void *)a3 + 50) |= 0x400000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)a3 + 64) = self->_pkgLifeTimeVO;
  *((void *)a3 + 50) |= 0x800000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 32) = self->_decisionVO;
  *((void *)a3 + 50) |= 0x8000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x800) == 0) {
      goto LABEL_47;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 31) = self->_decisionVIBE;
  *((void *)a3 + 50) |= 0x4000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x800) == 0)
  {
LABEL_47:
    if ((v8 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 82) = self->_videoStreamingStallTime;
  *((_DWORD *)a3 + 102) |= 0x800u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x400) == 0)
  {
LABEL_48:
    if ((v8 & 8) == 0) {
      goto LABEL_49;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 81) = self->_txber;
  *((_DWORD *)a3 + 102) |= 0x400u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 8) == 0)
  {
LABEL_49:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 74) = self->_rxRetry;
  *((_DWORD *)a3 + 102) |= 8u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x2000) == 0)
  {
LABEL_50:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)a3 + 84) = self->_weightedAveragePhyrateTx;
  *((_DWORD *)a3 + 102) |= 0x2000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x1000) == 0)
  {
LABEL_51:
    if ((v8 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)a3 + 83) = self->_weightedAveragePhyrateRx;
  *((_DWORD *)a3 + 102) |= 0x1000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x4000) == 0)
  {
LABEL_52:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)a3 + 85) = self->_weightedAverageRssi;
  *((_DWORD *)a3 + 102) |= 0x4000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x8000) == 0)
  {
LABEL_53:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)a3 + 86) = self->_weightedAverageSnr;
  *((_DWORD *)a3 + 102) |= 0x8000u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)a3 + 27) = self->_cmDataSentCount;
  *((void *)a3 + 50) |= 0x400000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x800000) == 0)
  {
LABEL_55:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)a3 + 28) = self->_cmDataSentDuration;
  *((void *)a3 + 50) |= 0x800000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)a3 + 29) = self->_cmEstimatedBandwidth;
  *((void *)a3 + 50) |= 0x1000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_57:
    if ((v8 & 2) == 0) {
      goto LABEL_58;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)a3 + 34) = self->_devicePointOfInterest;
  *((void *)a3 + 50) |= 0x20000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 2) == 0)
  {
LABEL_58:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)a3 + 72) = self->_rrcState;
  *((_DWORD *)a3 + 102) |= 2u;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_59:
    if ((v8 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)a3 + 54) = self->_mlPredictedWiFiBW;
  *((void *)a3 + 50) |= 0x2000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((v8 & 0x100000) == 0)
  {
LABEL_60:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)a3 + 91) = self->_wifiModelVersion;
  *((_DWORD *)a3 + 102) |= 0x100000u;
  uint64_t v7 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x80000) == 0)
  {
LABEL_61:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)a3 + 90) = self->_wifiModelConfidenceLevel;
  *((_DWORD *)a3 + 102) |= 0x80000u;
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)a3 + 53) = self->_mlPredictedCellBW;
  *((void *)a3 + 50) |= 0x1000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000) == 0)
  {
LABEL_63:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)a3 + 21) = self->_cellModelVersion;
  *((void *)a3 + 50) |= 0x10000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x8000) == 0)
  {
LABEL_64:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_126:
  *((_DWORD *)a3 + 20) = self->_cellModelConfidenceLevel;
  *((void *)a3 + 50) |= 0x8000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_65:
    *((_DWORD *)a3 + 18) = self->_cellEstimatedBW;
    *((void *)a3 + 50) |= 0x2000uLL;
  }
LABEL_66:
  if (self->_appType) {
    [a3 setAppType:];
  }
  p_uint64_t has = &self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 75) = self->_tcpRTTAvg;
    *((_DWORD *)a3 + 102) |= 0x10u;
    uint64_t v11 = *(void *)p_has;
    int v10 = *((_DWORD *)&self->_has + 2);
    if ((v10 & 0x20) == 0) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
  uint64_t v11 = *(void *)p_has;
  if ((v10 & 0x20) != 0)
  {
LABEL_129:
    *((_DWORD *)a3 + 76) = self->_tcpRTTmin;
    *((_DWORD *)a3 + 102) |= 0x20u;
    uint64_t v11 = (uint64_t)self->_has;
    int v10 = *((_DWORD *)&self->_has + 2);
  }
LABEL_130:
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 77) = self->_tcpRTTvar;
    *((_DWORD *)a3 + 102) |= 0x40u;
    uint64_t v11 = (uint64_t)self->_has;
    int v10 = *((_DWORD *)&self->_has + 2);
    if ((v11 & 0x8000000000000000) == 0)
    {
LABEL_132:
      if ((v10 & 1) == 0) {
        goto LABEL_133;
      }
      goto LABEL_167;
    }
  }
  else if ((v11 & 0x8000000000000000) == 0)
  {
    goto LABEL_132;
  }
  *((_DWORD *)a3 + 70) = self->_ratioDupeBytes;
  *((void *)a3 + 50) |= 0x8000000000000000;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 1) == 0)
  {
LABEL_133:
    if ((v11 & 0x400) == 0) {
      goto LABEL_134;
    }
    goto LABEL_168;
  }
LABEL_167:
  *((_DWORD *)a3 + 71) = self->_ratioOOBBytes;
  *((_DWORD *)a3 + 102) |= 1u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x400) == 0)
  {
LABEL_134:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_169;
  }
LABEL_168:
  *((_DWORD *)a3 + 15) = self->_cellARFCN;
  *((void *)a3 + 50) |= 0x400uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x1000) == 0)
  {
LABEL_135:
    if ((v11 & 0x800) == 0) {
      goto LABEL_136;
    }
    goto LABEL_170;
  }
LABEL_169:
  *((_DWORD *)a3 + 17) = self->_cellChannelBW;
  *((void *)a3 + 50) |= 0x1000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800) == 0)
  {
LABEL_136:
    if ((v11 & 0x200000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((_DWORD *)a3 + 16) = self->_cellBandInfo;
  *((void *)a3 + 50) |= 0x800uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_137:
    if ((v11 & 0x800000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((_DWORD *)a3 + 50) = self->_maxDLCAConfigured;
  *((void *)a3 + 50) |= 0x200000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x800000000000) == 0)
  {
LABEL_138:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_173;
  }
LABEL_172:
  *((_DWORD *)a3 + 52) = self->_maxULCAConfigured;
  *((void *)a3 + 50) |= 0x800000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10000) == 0)
  {
LABEL_139:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_174;
  }
LABEL_173:
  *((_DWORD *)a3 + 87) = self->_wifChannelBW;
  *((_DWORD *)a3 + 102) |= 0x10000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x20000) == 0)
  {
LABEL_140:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_175;
  }
LABEL_174:
  *((_DWORD *)a3 + 88) = self->_wifChannelType;
  *((_DWORD *)a3 + 102) |= 0x20000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x40000) == 0)
  {
LABEL_141:
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_176;
  }
LABEL_175:
  *((_DWORD *)a3 + 89) = self->_wifiCapability;
  *((_DWORD *)a3 + 102) |= 0x40000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_142:
    if ((v10 & 0x10000000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_177;
  }
LABEL_176:
  *((_DWORD *)a3 + 37) = self->_estimatedSpeed;
  *((void *)a3 + 50) |= 0x100000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_143:
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_178;
  }
LABEL_177:
  *((unsigned char *)a3 + 396) = self->_cellNsaEnabled;
  *((_DWORD *)a3 + 102) |= 0x10000000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_144:
    if ((v11 & 0x20000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_179;
  }
LABEL_178:
  *((unsigned char *)a3 + 397) = self->_isFR1;
  *((_DWORD *)a3 + 102) |= 0x20000000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x20000) == 0)
  {
LABEL_145:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_180;
  }
LABEL_179:
  *((_DWORD *)a3 + 22) = self->_cellNrRSRP;
  *((void *)a3 + 50) |= 0x20000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x40000) == 0)
  {
LABEL_146:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_181;
  }
LABEL_180:
  *((_DWORD *)a3 + 23) = self->_cellNrRSRQ;
  *((void *)a3 + 50) |= 0x40000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80000) == 0)
  {
LABEL_147:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_182;
  }
LABEL_181:
  *((_DWORD *)a3 + 24) = self->_cellNrSNR;
  *((void *)a3 + 50) |= 0x80000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x4000) == 0)
  {
LABEL_148:
    if ((v11 & 0x80000000000000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_183;
  }
LABEL_182:
  *((_DWORD *)a3 + 19) = self->_cellLteRSRQ;
  *((void *)a3 + 50) |= 0x4000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_149:
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_184;
  }
LABEL_183:
  *((_DWORD *)a3 + 60) = self->_pActualLowBandwidth;
  *((void *)a3 + 50) |= 0x80000000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_150:
    if ((v10 & 0x800000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_185;
  }
LABEL_184:
  *((_DWORD *)a3 + 96) = self->_wifimcsindex;
  *((_DWORD *)a3 + 102) |= 0x2000000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x800000) == 0)
  {
LABEL_151:
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_186;
  }
LABEL_185:
  *((_DWORD *)a3 + 94) = self->_wifiguardinterval;
  *((_DWORD *)a3 + 102) |= 0x800000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_152:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_187;
  }
LABEL_186:
  *((_DWORD *)a3 + 97) = self->_wifinumberOfSpatialStreams;
  *((_DWORD *)a3 + 102) |= 0x4000000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x400000) == 0)
  {
LABEL_153:
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_188;
  }
LABEL_187:
  *((_DWORD *)a3 + 93) = self->_wifichannel;
  *((_DWORD *)a3 + 102) |= 0x400000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_154:
    if ((v11 & 0x10000000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_189;
  }
LABEL_188:
  *((_DWORD *)a3 + 95) = self->_wifilowDataMode;
  *((_DWORD *)a3 + 102) |= 0x1000000u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_155:
    if ((v11 & 0x80) == 0) {
      goto LABEL_156;
    }
    goto LABEL_190;
  }
LABEL_189:
  *((_DWORD *)a3 + 45) = self->_isWfiCaptive;
  *((void *)a3 + 50) |= 0x10000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x80) == 0)
  {
LABEL_156:
    if ((v10 & 0x80) == 0) {
      goto LABEL_157;
    }
    goto LABEL_191;
  }
LABEL_190:
  *((_DWORD *)a3 + 12) = self->_btWiFiCoexState;
  *((void *)a3 + 50) |= 0x80uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x80) == 0)
  {
LABEL_157:
    if ((v11 & 0x10000000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_192;
  }
LABEL_191:
  *((_DWORD *)a3 + 78) = self->_totalConfiguredBw;
  *((_DWORD *)a3 + 102) |= 0x80u;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x10000000000000) == 0)
  {
LABEL_158:
    if ((v11 & 0x40000000000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_193;
  }
LABEL_192:
  *((_DWORD *)a3 + 57) = self->_nrConfiguredBw;
  *((void *)a3 + 50) |= 0x10000000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v11 & 0x40000000000000) == 0)
  {
LABEL_159:
    if ((v10 & 0x100) == 0) {
      goto LABEL_160;
    }
    goto LABEL_194;
  }
LABEL_193:
  *((_DWORD *)a3 + 59) = self->_nrTotalScheduledMimoLayers;
  *((void *)a3 + 50) |= 0x40000000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_160:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_195;
  }
LABEL_194:
  *((_DWORD *)a3 + 79) = self->_totalConfiguredMimoLayers;
  *((_DWORD *)a3 + 102) |= 0x100u;
  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_161:
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_162;
    }
    goto LABEL_196;
  }
LABEL_195:
  *((_DWORD *)a3 + 49) = self->_lteMaxScheduledMimoLayersInACell;
  *((void *)a3 + 50) |= 0x100000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_162:
    if ((v11 & 0x2000000) == 0) {
      return;
    }
    goto LABEL_163;
  }
LABEL_196:
  *((_DWORD *)a3 + 58) = self->_nrMaxDlModulation;
  *((void *)a3 + 50) |= 0x20000000000000uLL;
  if ((*(void *)&self->_has & 0x2000000) == 0) {
    return;
  }
LABEL_163:
  *((_DWORD *)a3 + 30) = self->_coldStartType;
  *((void *)a3 + 50) |= 0x2000000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_event;
    *(void *)(v5 + 400) |= 0x200000000uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_bufferInterval;
    *(void *)(v5 + 400) |= 0x100uLL;
    uint64_t has = (uint64_t)self->_has;
    int v8 = *((_DWORD *)&self->_has + 2);
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_69;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v5 + 8) = self->_wifiRssi;
  *(void *)(v5 + 400) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v5 + 252) = self->_phyRate;
  *(void *)(v5 + 400) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 268) = self->_qbssLoad;
  *(void *)(v5 + 400) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 56) = self->_cca;
  *(void *)(v5 + 400) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 40) = self->_bcnPer;
  *(void *)(v5 + 400) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  int v8 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x800000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 160) = self->_expectedThroughputVO;
  *(void *)(v5 + 400) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x200000) == 0)
  {
LABEL_11:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 368) = self->_wifiSinr;
  *(_DWORD *)(v5 + 408) |= 0x200000u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_12:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 260) = self->_pktLifeTimeVO;
  *(void *)(v5 + 400) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 264) = self->_pktLossRateVO;
  *(void *)(v5 + 400) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 188) = self->_lqmScoreWifi;
  *(void *)(v5 + 400) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x400000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 248) = self->_packetLossRateVIBE;
  *(void *)(v5 + 400) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_16:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 156) = self->_expectedThroughputVIBE;
  *(void *)(v5 + 400) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 244) = self->_packetLifetimeVIBE;
  *(void *)(v5 + 400) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 36) = self->_badDecisionsCounterVO;
  *(void *)(v5 + 400) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 168) = self->_goodDecisionsCounterVO;
  *(void *)(v5 + 400) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_20:
    if ((has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 176) = self->_invalidDecisionsCounterVO;
  *(void *)(v5 + 400) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_21:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 32) = self->_badDecisionsCounterVIBE;
  *(void *)(v5 + 400) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_22:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 164) = self->_goodDecisionsCounterVIBE;
  *(void *)(v5 + 400) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_86:
  *(_DWORD *)(v5 + 172) = self->_invalidDecisionsCounterVIBE;
  *(void *)(v5 + 400) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x80000000000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v5 + 192) = self->_lqmScorecellular;
    *(void *)(v5 + 400) |= 0x80000000000uLL;
  }
LABEL_25:

  *(void *)(v6 + 272) = [(NSString *)self->_ratType copyWithZone:a3];
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_cellRsrp;
    *(void *)(v6 + 400) |= 0x100000uLL;
    uint64_t v9 = (uint64_t)self->_has;
  }
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x200000) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_cellSinr;
    *(void *)(v6 + 400) |= 0x200000uLL;
    uint64_t v9 = (uint64_t)self->_has;
    int v10 = *((_DWORD *)&self->_has + 2);
    if ((v9 & 0x40) == 0)
    {
LABEL_29:
      if ((v10 & 0x200) == 0) {
        goto LABEL_30;
      }
      goto LABEL_90;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v6 + 44) = self->_btRssi;
  *(void *)(v6 + 400) |= 0x40uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x200) == 0)
  {
LABEL_30:
    if ((v10 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 320) = self->_txRetransmissionRate;
  *(_DWORD *)(v6 + 408) |= 0x200u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 4) == 0)
  {
LABEL_31:
    if ((v9 & 0x20000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 292) = self->_rxRetransmissionRate;
  *(_DWORD *)(v6 + 408) |= 4u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_32:
    if ((v10 & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 184) = self->_lqmScoreBT;
  *(void *)(v6 + 400) |= 0x20000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_33:
    if ((v9 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 392) = self->_wrmRecommendedRAT;
  *(_DWORD *)(v6 + 408) |= 0x8000000u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 4) == 0)
  {
LABEL_34:
    if ((v9 & 2) == 0) {
      goto LABEL_35;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 20) = self->_actualLowBandwidth;
  *(void *)(v6 + 400) |= 4uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 2) == 0)
  {
LABEL_35:
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 16) = self->_actualHighBandwidth;
  *(void *)(v6 + 400) |= 2uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x40000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 144) = self->_estimatedLowBandwidth;
  *(void *)(v6 + 400) |= 0x80000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x40000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x8000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v6 + 140) = self->_estimatedHighBandwidth;
  *(void *)(v6 + 400) |= 0x40000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_38:
    if ((v9 & 0x4000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v6 + 224) = self->_movingAvgLowBandwidth;
  *(void *)(v6 + 400) |= 0x8000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_39:
    if ((v9 & 0x10000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v6 + 220) = self->_movingAvgHighBandwidth;
  *(void *)(v6 + 400) |= 0x4000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x10000000) == 0)
  {
LABEL_40:
    if ((v9 & 0x400000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v6 + 132) = self->_deviation;
  *(void *)(v6 + 400) |= 0x10000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x400000000000) == 0)
  {
LABEL_41:
    if ((v9 & 0x800000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v6 + 204) = self->_maxOfActualLowBandwidth;
  *(void *)(v6 + 400) |= 0x400000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_42:
    if ((v9 & 0x8000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v6 + 256) = self->_pkgLifeTimeVO;
  *(void *)(v6 + 400) |= 0x800000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x8000000) == 0)
  {
LABEL_43:
    if ((v9 & 0x4000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(_DWORD *)(v6 + 128) = self->_decisionVO;
  *(void *)(v6 + 400) |= 0x8000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x4000000) == 0)
  {
LABEL_44:
    if ((v10 & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_DWORD *)(v6 + 124) = self->_decisionVIBE;
  *(void *)(v6 + 400) |= 0x4000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x800) == 0)
  {
LABEL_45:
    if ((v10 & 0x400) == 0) {
      goto LABEL_46;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(_DWORD *)(v6 + 328) = self->_videoStreamingStallTime;
  *(_DWORD *)(v6 + 408) |= 0x800u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x400) == 0)
  {
LABEL_46:
    if ((v10 & 8) == 0) {
      goto LABEL_47;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v6 + 324) = self->_txber;
  *(_DWORD *)(v6 + 408) |= 0x400u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 8) == 0)
  {
LABEL_47:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v6 + 296) = self->_rxRetry;
  *(_DWORD *)(v6 + 408) |= 8u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x2000) == 0)
  {
LABEL_48:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v6 + 336) = self->_weightedAveragePhyrateTx;
  *(_DWORD *)(v6 + 408) |= 0x2000u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x1000) == 0)
  {
LABEL_49:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(_DWORD *)(v6 + 332) = self->_weightedAveragePhyrateRx;
  *(_DWORD *)(v6 + 408) |= 0x1000u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x4000) == 0)
  {
LABEL_50:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v6 + 340) = self->_weightedAverageRssi;
  *(_DWORD *)(v6 + 408) |= 0x4000u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x8000) == 0)
  {
LABEL_51:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(_DWORD *)(v6 + 344) = self->_weightedAverageSnr;
  *(_DWORD *)(v6 + 408) |= 0x8000u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x400000) == 0)
  {
LABEL_52:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(v6 + 108) = self->_cmDataSentCount;
  *(void *)(v6 + 400) |= 0x400000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x800000) == 0)
  {
LABEL_53:
    if ((v9 & 0x1000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(_DWORD *)(v6 + 112) = self->_cmDataSentDuration;
  *(void *)(v6 + 400) |= 0x800000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_54:
    if ((v9 & 0x20000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v6 + 116) = self->_cmEstimatedBandwidth;
  *(void *)(v6 + 400) |= 0x1000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x20000000) == 0)
  {
LABEL_55:
    if ((v10 & 2) == 0) {
      goto LABEL_56;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v6 + 136) = self->_devicePointOfInterest;
  *(void *)(v6 + 400) |= 0x20000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 2) == 0)
  {
LABEL_56:
    if ((v9 & 0x2000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v6 + 288) = self->_rrcState;
  *(_DWORD *)(v6 + 408) |= 2u;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v9 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((v10 & 0x100000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(_DWORD *)(v6 + 216) = self->_mlPredictedWiFiBW;
  *(void *)(v6 + 400) |= 0x2000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  int v10 = *((_DWORD *)&self->_has + 2);
  if ((v10 & 0x100000) == 0)
  {
LABEL_58:
    if ((v10 & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(_DWORD *)(v6 + 364) = self->_wifiModelVersion;
  *(_DWORD *)(v6 + 408) |= 0x100000u;
  uint64_t v9 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x80000) == 0)
  {
LABEL_59:
    if ((v9 & 0x1000000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(_DWORD *)(v6 + 360) = self->_wifiModelConfidenceLevel;
  *(_DWORD *)(v6 + 408) |= 0x80000u;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000) == 0)
  {
LABEL_60:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(_DWORD *)(v6 + 212) = self->_mlPredictedCellBW;
  *(void *)(v6 + 400) |= 0x1000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x10000) == 0)
  {
LABEL_61:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(v6 + 84) = self->_cellModelVersion;
  *(void *)(v6 + 400) |= 0x10000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000) == 0)
  {
LABEL_62:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_122:
  *(_DWORD *)(v6 + 80) = self->_cellModelConfidenceLevel;
  *(void *)(v6 + 400) |= 0x8000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_63:
    *(_DWORD *)(v6 + 72) = self->_cellEstimatedBW;
    *(void *)(v6 + 400) |= 0x2000uLL;
  }
LABEL_64:

  *(void *)(v6 + 24) = [(NSString *)self->_appType copyWithZone:a3];
  p_uint64_t has = &self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 300) = self->_tcpRTTAvg;
    *(_DWORD *)(v6 + 408) |= 0x10u;
    uint64_t v13 = *(void *)p_has;
    int v12 = *((_DWORD *)&self->_has + 2);
    if ((v12 & 0x20) == 0) {
      goto LABEL_126;
    }
    goto LABEL_125;
  }
  uint64_t v13 = *(void *)p_has;
  if ((v12 & 0x20) != 0)
  {
LABEL_125:
    *(_DWORD *)(v6 + 304) = self->_tcpRTTmin;
    *(_DWORD *)(v6 + 408) |= 0x20u;
    uint64_t v13 = (uint64_t)self->_has;
    int v12 = *((_DWORD *)&self->_has + 2);
  }
LABEL_126:
  if ((v12 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 308) = self->_tcpRTTvar;
    *(_DWORD *)(v6 + 408) |= 0x40u;
    uint64_t v13 = (uint64_t)self->_has;
    int v12 = *((_DWORD *)&self->_has + 2);
    if ((v13 & 0x8000000000000000) == 0)
    {
LABEL_128:
      if ((v12 & 1) == 0) {
        goto LABEL_129;
      }
      goto LABEL_163;
    }
  }
  else if ((v13 & 0x8000000000000000) == 0)
  {
    goto LABEL_128;
  }
  *(_DWORD *)(v6 + 280) = self->_ratioDupeBytes;
  *(void *)(v6 + 400) |= 0x8000000000000000;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 1) == 0)
  {
LABEL_129:
    if ((v13 & 0x400) == 0) {
      goto LABEL_130;
    }
    goto LABEL_164;
  }
LABEL_163:
  *(_DWORD *)(v6 + 284) = self->_ratioOOBBytes;
  *(_DWORD *)(v6 + 408) |= 1u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x400) == 0)
  {
LABEL_130:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_165;
  }
LABEL_164:
  *(_DWORD *)(v6 + 60) = self->_cellARFCN;
  *(void *)(v6 + 400) |= 0x400uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x1000) == 0)
  {
LABEL_131:
    if ((v13 & 0x800) == 0) {
      goto LABEL_132;
    }
    goto LABEL_166;
  }
LABEL_165:
  *(_DWORD *)(v6 + 68) = self->_cellChannelBW;
  *(void *)(v6 + 400) |= 0x1000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x800) == 0)
  {
LABEL_132:
    if ((v13 & 0x200000000000) == 0) {
      goto LABEL_133;
    }
    goto LABEL_167;
  }
LABEL_166:
  *(_DWORD *)(v6 + 64) = self->_cellBandInfo;
  *(void *)(v6 + 400) |= 0x800uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x200000000000) == 0)
  {
LABEL_133:
    if ((v13 & 0x800000000000) == 0) {
      goto LABEL_134;
    }
    goto LABEL_168;
  }
LABEL_167:
  *(_DWORD *)(v6 + 200) = self->_maxDLCAConfigured;
  *(void *)(v6 + 400) |= 0x200000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x800000000000) == 0)
  {
LABEL_134:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_169;
  }
LABEL_168:
  *(_DWORD *)(v6 + 208) = self->_maxULCAConfigured;
  *(void *)(v6 + 400) |= 0x800000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10000) == 0)
  {
LABEL_135:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_170;
  }
LABEL_169:
  *(_DWORD *)(v6 + 348) = self->_wifChannelBW;
  *(_DWORD *)(v6 + 408) |= 0x10000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x20000) == 0)
  {
LABEL_136:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_171;
  }
LABEL_170:
  *(_DWORD *)(v6 + 352) = self->_wifChannelType;
  *(_DWORD *)(v6 + 408) |= 0x20000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x40000) == 0)
  {
LABEL_137:
    if ((v13 & 0x100000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_172;
  }
LABEL_171:
  *(_DWORD *)(v6 + 356) = self->_wifiCapability;
  *(_DWORD *)(v6 + 408) |= 0x40000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x100000000) == 0)
  {
LABEL_138:
    if ((v12 & 0x10000000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_173;
  }
LABEL_172:
  *(_DWORD *)(v6 + 148) = self->_estimatedSpeed;
  *(void *)(v6 + 400) |= 0x100000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x10000000) == 0)
  {
LABEL_139:
    if ((v12 & 0x20000000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_174;
  }
LABEL_173:
  *(unsigned char *)(v6 + 396) = self->_cellNsaEnabled;
  *(_DWORD *)(v6 + 408) |= 0x10000000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x20000000) == 0)
  {
LABEL_140:
    if ((v13 & 0x20000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_175;
  }
LABEL_174:
  *(unsigned char *)(v6 + 397) = self->_isFR1;
  *(_DWORD *)(v6 + 408) |= 0x20000000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x20000) == 0)
  {
LABEL_141:
    if ((v13 & 0x40000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_176;
  }
LABEL_175:
  *(_DWORD *)(v6 + 88) = self->_cellNrRSRP;
  *(void *)(v6 + 400) |= 0x20000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x40000) == 0)
  {
LABEL_142:
    if ((v13 & 0x80000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_177;
  }
LABEL_176:
  *(_DWORD *)(v6 + 92) = self->_cellNrRSRQ;
  *(void *)(v6 + 400) |= 0x40000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x80000) == 0)
  {
LABEL_143:
    if ((v13 & 0x4000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_178;
  }
LABEL_177:
  *(_DWORD *)(v6 + 96) = self->_cellNrSNR;
  *(void *)(v6 + 400) |= 0x80000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x4000) == 0)
  {
LABEL_144:
    if ((v13 & 0x80000000000000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_179;
  }
LABEL_178:
  *(_DWORD *)(v6 + 76) = self->_cellLteRSRQ;
  *(void *)(v6 + 400) |= 0x4000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x80000000000000) == 0)
  {
LABEL_145:
    if ((v12 & 0x2000000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_180;
  }
LABEL_179:
  *(_DWORD *)(v6 + 240) = self->_pActualLowBandwidth;
  *(void *)(v6 + 400) |= 0x80000000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x2000000) == 0)
  {
LABEL_146:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_181;
  }
LABEL_180:
  *(_DWORD *)(v6 + 384) = self->_wifimcsindex;
  *(_DWORD *)(v6 + 408) |= 0x2000000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x800000) == 0)
  {
LABEL_147:
    if ((v12 & 0x4000000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_182;
  }
LABEL_181:
  *(_DWORD *)(v6 + 376) = self->_wifiguardinterval;
  *(_DWORD *)(v6 + 408) |= 0x800000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x4000000) == 0)
  {
LABEL_148:
    if ((v12 & 0x400000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_183;
  }
LABEL_182:
  *(_DWORD *)(v6 + 388) = self->_wifinumberOfSpatialStreams;
  *(_DWORD *)(v6 + 408) |= 0x4000000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x400000) == 0)
  {
LABEL_149:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_184;
  }
LABEL_183:
  *(_DWORD *)(v6 + 372) = self->_wifichannel;
  *(_DWORD *)(v6 + 408) |= 0x400000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x1000000) == 0)
  {
LABEL_150:
    if ((v13 & 0x10000000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_185;
  }
LABEL_184:
  *(_DWORD *)(v6 + 380) = self->_wifilowDataMode;
  *(_DWORD *)(v6 + 408) |= 0x1000000u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x10000000000) == 0)
  {
LABEL_151:
    if ((v13 & 0x80) == 0) {
      goto LABEL_152;
    }
    goto LABEL_186;
  }
LABEL_185:
  *(_DWORD *)(v6 + 180) = self->_isWfiCaptive;
  *(void *)(v6 + 400) |= 0x10000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x80) == 0)
  {
LABEL_152:
    if ((v12 & 0x80) == 0) {
      goto LABEL_153;
    }
    goto LABEL_187;
  }
LABEL_186:
  *(_DWORD *)(v6 + 48) = self->_btWiFiCoexState;
  *(void *)(v6 + 400) |= 0x80uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v12 & 0x80) == 0)
  {
LABEL_153:
    if ((v13 & 0x10000000000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_188;
  }
LABEL_187:
  *(_DWORD *)(v6 + 312) = self->_totalConfiguredBw;
  *(_DWORD *)(v6 + 408) |= 0x80u;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x10000000000000) == 0)
  {
LABEL_154:
    if ((v13 & 0x40000000000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_189;
  }
LABEL_188:
  *(_DWORD *)(v6 + 228) = self->_nrConfiguredBw;
  *(void *)(v6 + 400) |= 0x10000000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  int v12 = *((_DWORD *)&self->_has + 2);
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_155:
    if ((v12 & 0x100) == 0) {
      goto LABEL_156;
    }
    goto LABEL_190;
  }
LABEL_189:
  *(_DWORD *)(v6 + 236) = self->_nrTotalScheduledMimoLayers;
  *(void *)(v6 + 400) |= 0x40000000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  if ((*((_DWORD *)&self->_has + 2) & 0x100) == 0)
  {
LABEL_156:
    if ((v13 & 0x100000000000) == 0) {
      goto LABEL_157;
    }
    goto LABEL_191;
  }
LABEL_190:
  *(_DWORD *)(v6 + 316) = self->_totalConfiguredMimoLayers;
  *(_DWORD *)(v6 + 408) |= 0x100u;
  uint64_t v13 = (uint64_t)self->_has;
  if ((v13 & 0x100000000000) == 0)
  {
LABEL_157:
    if ((v13 & 0x20000000000000) == 0) {
      goto LABEL_158;
    }
LABEL_192:
    *(_DWORD *)(v6 + 232) = self->_nrMaxDlModulation;
    *(void *)(v6 + 400) |= 0x20000000000000uLL;
    if ((*(void *)&self->_has & 0x2000000) == 0) {
      return (id)v6;
    }
    goto LABEL_159;
  }
LABEL_191:
  *(_DWORD *)(v6 + 196) = self->_lteMaxScheduledMimoLayersInACell;
  *(void *)(v6 + 400) |= 0x100000000000uLL;
  uint64_t v13 = (uint64_t)self->_has;
  if ((v13 & 0x20000000000000) != 0) {
    goto LABEL_192;
  }
LABEL_158:
  if ((v13 & 0x2000000) != 0)
  {
LABEL_159:
    *(_DWORD *)(v6 + 120) = self->_coldStartType;
    *(void *)(v6 + 400) |= 0x2000000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  uint64_t has = (uint64_t)self->_has;
  int v7 = *((_DWORD *)&self->_has + 2);
  uint64_t v8 = *((void *)a3 + 50);
  int v9 = *((_DWORD *)a3 + 102);
  if ((has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_event != *((_DWORD *)a3 + 38)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_bufferInterval != *((_DWORD *)a3 + 13)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_482;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_wifiRssi != *((void *)a3 + 1)) {
      goto LABEL_482;
    }
  }
  else if (v8)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v8 & 0x400000000000000) == 0 || self->_phyRate != *((_DWORD *)a3 + 63)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x400000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v8 & 0x4000000000000000) == 0 || self->_qbssLoad != *((_DWORD *)a3 + 67)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x4000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_cca != *((_DWORD *)a3 + 14)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_bcnPer != *((_DWORD *)a3 + 10)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0 || self->_expectedThroughputVO != *((_DWORD *)a3 + 40)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_wifiSinr != *((_DWORD *)a3 + 92)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v8 & 0x1000000000000000) == 0 || self->_pktLifeTimeVO != *((_DWORD *)a3 + 65)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x1000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v8 & 0x2000000000000000) == 0 || self->_pktLossRateVO != *((_DWORD *)a3 + 66)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x2000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_lqmScoreWifi != *((_DWORD *)a3 + 47)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v8 & 0x200000000000000) == 0 || self->_packetLossRateVIBE != *((_DWORD *)a3 + 62)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x200000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0 || self->_expectedThroughputVIBE != *((_DWORD *)a3 + 39)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0 || self->_packetLifetimeVIBE != *((_DWORD *)a3 + 61)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_badDecisionsCounterVO != *((_DWORD *)a3 + 9)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_goodDecisionsCounterVO != *((_DWORD *)a3 + 42)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_invalidDecisionsCounterVO != *((_DWORD *)a3 + 44)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_badDecisionsCounterVIBE != *((_DWORD *)a3 + 8)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v8 & 0x1000000000) == 0 || self->_goodDecisionsCounterVIBE != *((_DWORD *)a3 + 41)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x1000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v8 & 0x4000000000) == 0 || self->_invalidDecisionsCounterVIBE != *((_DWORD *)a3 + 43)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x4000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v8 & 0x80000000000) == 0 || self->_lqmScorecellular != *((_DWORD *)a3 + 48)) {
      goto LABEL_482;
    }
  }
  else if ((v8 & 0x80000000000) != 0)
  {
    goto LABEL_482;
  }
  ratType = self->_ratType;
  if ((unint64_t)ratType | *((void *)a3 + 34))
  {
    int v5 = -[NSString isEqual:](ratType, "isEqual:");
    if (!v5) {
      return v5;
    }
    uint64_t has = (uint64_t)self->_has;
    int v7 = *((_DWORD *)&self->_has + 2);
  }
  uint64_t v11 = *((void *)a3 + 50);
  int v12 = *((_DWORD *)a3 + 102);
  if ((has & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0 || self->_cellRsrp != *((_DWORD *)a3 + 25)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0 || self->_cellSinr != *((_DWORD *)a3 + 26)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_btRssi != *((_DWORD *)a3 + 11)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_txRetransmissionRate != *((_DWORD *)a3 + 80)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_rxRetransmissionRate != *((_DWORD *)a3 + 73)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v11 & 0x20000000000) == 0 || self->_lqmScoreBT != *((_DWORD *)a3 + 46)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x20000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) == 0 || self->_wrmRecommendedRAT != *((_DWORD *)a3 + 98)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x8000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_actualLowBandwidth != *((_DWORD *)a3 + 5)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_actualHighBandwidth != *((_DWORD *)a3 + 4)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) == 0 || self->_estimatedLowBandwidth != *((_DWORD *)a3 + 36)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x80000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v11 & 0x40000000) == 0 || self->_estimatedHighBandwidth != *((_DWORD *)a3 + 35)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x40000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v11 & 0x8000000000000) == 0 || self->_movingAvgLowBandwidth != *((_DWORD *)a3 + 56)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x8000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v11 & 0x4000000000000) == 0 || self->_movingAvgHighBandwidth != *((_DWORD *)a3 + 55)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x4000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v11 & 0x10000000) == 0 || self->_deviation != *((_DWORD *)a3 + 33)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x10000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v11 & 0x400000000000) == 0 || self->_maxOfActualLowBandwidth != *((_DWORD *)a3 + 51)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x400000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v11 & 0x800000000000000) == 0 || self->_pkgLifeTimeVO != *((_DWORD *)a3 + 64)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x800000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v11 & 0x8000000) == 0 || self->_decisionVO != *((_DWORD *)a3 + 32)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x8000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0 || self->_decisionVIBE != *((_DWORD *)a3 + 31)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_videoStreamingStallTime != *((_DWORD *)a3 + 82)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_txber != *((_DWORD *)a3 + 81)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_rxRetry != *((_DWORD *)a3 + 74)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_weightedAveragePhyrateTx != *((_DWORD *)a3 + 84)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_weightedAveragePhyrateRx != *((_DWORD *)a3 + 83)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_weightedAverageRssi != *((_DWORD *)a3 + 85)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_weightedAverageSnr != *((_DWORD *)a3 + 86)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0 || self->_cmDataSentCount != *((_DWORD *)a3 + 27)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0 || self->_cmDataSentDuration != *((_DWORD *)a3 + 28)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0 || self->_cmEstimatedBandwidth != *((_DWORD *)a3 + 29)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0 || self->_devicePointOfInterest != *((_DWORD *)a3 + 34)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_rrcState != *((_DWORD *)a3 + 72)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v11 & 0x2000000000000) == 0 || self->_mlPredictedWiFiBW != *((_DWORD *)a3 + 54)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x2000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x100000) != 0)
  {
    if ((v12 & 0x100000) == 0 || self->_wifiModelVersion != *((_DWORD *)a3 + 91)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x100000) != 0)
  {
    goto LABEL_482;
  }
  if ((v7 & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_wifiModelConfidenceLevel != *((_DWORD *)a3 + 90)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x80000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v11 & 0x1000000000000) == 0 || self->_mlPredictedCellBW != *((_DWORD *)a3 + 53)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x1000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_cellModelVersion != *((_DWORD *)a3 + 21)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_cellModelConfidenceLevel != *((_DWORD *)a3 + 20)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_cellEstimatedBW != *((_DWORD *)a3 + 18)) {
      goto LABEL_482;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_482;
  }
  appType = self->_appType;
  if ((unint64_t)appType | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](appType, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  uint64_t v14 = (uint64_t)self->_has;
  int v15 = *((_DWORD *)&self->_has + 2);
  uint64_t v16 = *((void *)a3 + 50);
  int v17 = *((_DWORD *)a3 + 102);
  if ((v15 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_tcpRTTAvg != *((_DWORD *)a3 + 75)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_tcpRTTmin != *((_DWORD *)a3 + 76)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_tcpRTTvar != *((_DWORD *)a3 + 77)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if (v14 < 0)
  {
    if ((v16 & 0x8000000000000000) == 0 || self->_ratioDupeBytes != *((_DWORD *)a3 + 70)) {
      goto LABEL_482;
    }
  }
  else if (v16 < 0)
  {
    goto LABEL_482;
  }
  if (v15)
  {
    if ((v17 & 1) == 0 || self->_ratioOOBBytes != *((_DWORD *)a3 + 71)) {
      goto LABEL_482;
    }
  }
  else if (v17)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x400) != 0)
  {
    if ((v16 & 0x400) == 0 || self->_cellARFCN != *((_DWORD *)a3 + 15)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x400) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x1000) != 0)
  {
    if ((v16 & 0x1000) == 0 || self->_cellChannelBW != *((_DWORD *)a3 + 17)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x1000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x800) != 0)
  {
    if ((v16 & 0x800) == 0 || self->_cellBandInfo != *((_DWORD *)a3 + 16)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x200000000000) != 0)
  {
    if ((v16 & 0x200000000000) == 0 || self->_maxDLCAConfigured != *((_DWORD *)a3 + 50)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x200000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x800000000000) != 0)
  {
    if ((v16 & 0x800000000000) == 0 || self->_maxULCAConfigured != *((_DWORD *)a3 + 52)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0 || self->_wifChannelBW != *((_DWORD *)a3 + 87)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0 || self->_wifChannelType != *((_DWORD *)a3 + 88)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0 || self->_wifiCapability != *((_DWORD *)a3 + 89)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x100000000) != 0)
  {
    if ((v16 & 0x100000000) == 0 || self->_estimatedSpeed != *((_DWORD *)a3 + 37)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x100000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x10000000) != 0)
  {
    if ((v17 & 0x10000000) == 0) {
      goto LABEL_482;
    }
    if (self->_cellNsaEnabled)
    {
      if (!*((unsigned char *)a3 + 396)) {
        goto LABEL_482;
      }
    }
    else if (*((unsigned char *)a3 + 396))
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x10000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x20000000) != 0)
  {
    if ((v17 & 0x20000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isFR1)
    {
      if (!*((unsigned char *)a3 + 397)) {
        goto LABEL_482;
      }
    }
    else if (*((unsigned char *)a3 + 397))
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x20000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_cellNrRSRP != *((_DWORD *)a3 + 22)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x40000) != 0)
  {
    if ((v16 & 0x40000) == 0 || self->_cellNrRSRQ != *((_DWORD *)a3 + 23)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x40000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x80000) != 0)
  {
    if ((v16 & 0x80000) == 0 || self->_cellNrSNR != *((_DWORD *)a3 + 24)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x80000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x4000) != 0)
  {
    if ((v16 & 0x4000) == 0 || self->_cellLteRSRQ != *((_DWORD *)a3 + 19)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x4000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0 || self->_pActualLowBandwidth != *((_DWORD *)a3 + 60)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x2000000) != 0)
  {
    if ((v17 & 0x2000000) == 0 || self->_wifimcsindex != *((_DWORD *)a3 + 96)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x2000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x800000) != 0)
  {
    if ((v17 & 0x800000) == 0 || self->_wifiguardinterval != *((_DWORD *)a3 + 94)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x800000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x4000000) != 0)
  {
    if ((v17 & 0x4000000) == 0 || self->_wifinumberOfSpatialStreams != *((_DWORD *)a3 + 97)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x4000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x400000) != 0)
  {
    if ((v17 & 0x400000) == 0 || self->_wifichannel != *((_DWORD *)a3 + 93)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x400000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0 || self->_wifilowDataMode != *((_DWORD *)a3 + 95)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x10000000000) != 0)
  {
    if ((v16 & 0x10000000000) == 0 || self->_isWfiCaptive != *((_DWORD *)a3 + 45)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x10000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_btWiFiCoexState != *((_DWORD *)a3 + 12)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_totalConfiguredBw != *((_DWORD *)a3 + 78)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x10000000000000) != 0)
  {
    if ((v16 & 0x10000000000000) == 0 || self->_nrConfiguredBw != *((_DWORD *)a3 + 57)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x10000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x40000000000000) != 0)
  {
    if ((v16 & 0x40000000000000) == 0 || self->_nrTotalScheduledMimoLayers != *((_DWORD *)a3 + 59)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x40000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v15 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_totalConfiguredMimoLayers != *((_DWORD *)a3 + 79)) {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x100000000000) != 0)
  {
    if ((v16 & 0x100000000000) == 0 || self->_lteMaxScheduledMimoLayersInACell != *((_DWORD *)a3 + 49)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x100000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v14 & 0x20000000000000) == 0)
  {
    if ((v16 & 0x20000000000000) == 0) {
      goto LABEL_478;
    }
LABEL_482:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v16 & 0x20000000000000) == 0 || self->_nrMaxDlModulation != *((_DWORD *)a3 + 58)) {
    goto LABEL_482;
  }
LABEL_478:
  LOBYTE(v5) = (*((void *)a3 + 50) & 0x2000000) == 0;
  if ((v14 & 0x2000000) != 0)
  {
    if ((v16 & 0x2000000) == 0 || self->_coldStartType != *((_DWORD *)a3 + 30)) {
      goto LABEL_482;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t has = (uint64_t)self->_has;
  int v4 = *((_DWORD *)&self->_has + 2);
  if ((has & 0x200000000) != 0)
  {
    uint64_t v105 = 2654435761 * self->_event;
    if ((has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v104 = 2654435761 * self->_bufferInterval;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v105 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v104 = 0;
  if (has)
  {
LABEL_4:
    uint64_t v103 = 2654435761 * self->_wifiRssi;
    if ((has & 0x400000000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v103 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_5:
    uint64_t v102 = 2654435761 * self->_phyRate;
    if ((has & 0x4000000000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v102 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_6:
    uint64_t v101 = 2654435761 * self->_qbssLoad;
    if ((has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v101 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v100 = 2654435761 * self->_cca;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v100 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v99 = 2654435761 * self->_bcnPer;
    if ((has & 0x800000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v99 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_9:
    uint64_t v98 = 2654435761 * self->_expectedThroughputVO;
    if ((v4 & 0x200000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v98 = 0;
  if ((v4 & 0x200000) != 0)
  {
LABEL_10:
    uint64_t v97 = 2654435761 * self->_wifiSinr;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v97 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t v96 = 2654435761 * self->_pktLifeTimeVO;
    if ((has & 0x2000000000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v96 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_12:
    uint64_t v95 = 2654435761 * self->_pktLossRateVO;
    if ((has & 0x40000000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v95 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_13:
    uint64_t v94 = 2654435761 * self->_lqmScoreWifi;
    if ((has & 0x200000000000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v94 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_14:
    uint64_t v93 = 2654435761 * self->_packetLossRateVIBE;
    if ((has & 0x400000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v93 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_15:
    uint64_t v92 = 2654435761 * self->_expectedThroughputVIBE;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v92 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_16:
    uint64_t v91 = 2654435761 * self->_packetLifetimeVIBE;
    if ((has & 0x10) != 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v91 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_17:
    uint64_t v90 = 2654435761 * self->_badDecisionsCounterVO;
    if ((has & 0x2000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v90 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_18:
    uint64_t v89 = 2654435761 * self->_goodDecisionsCounterVO;
    if ((has & 0x8000000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v89 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_19:
    uint64_t v88 = 2654435761 * self->_invalidDecisionsCounterVO;
    if ((has & 8) != 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v88 = 0;
  if ((has & 8) != 0)
  {
LABEL_20:
    uint64_t v87 = 2654435761 * self->_badDecisionsCounterVIBE;
    if ((has & 0x1000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v87 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_21:
    uint64_t v86 = 2654435761 * self->_goodDecisionsCounterVIBE;
    if ((has & 0x4000000000) != 0) {
      goto LABEL_22;
    }
LABEL_44:
    uint64_t v85 = 0;
    if ((has & 0x80000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_45;
  }
LABEL_43:
  uint64_t v86 = 0;
  if ((has & 0x4000000000) == 0) {
    goto LABEL_44;
  }
LABEL_22:
  uint64_t v85 = 2654435761 * self->_invalidDecisionsCounterVIBE;
  if ((has & 0x80000000000) != 0)
  {
LABEL_23:
    uint64_t v84 = 2654435761 * self->_lqmScorecellular;
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v84 = 0;
LABEL_46:
  NSUInteger v83 = [(NSString *)self->_ratType hash];
  int v5 = *((_DWORD *)&self->_has + 2);
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x100000) != 0)
  {
    uint64_t v82 = 2654435761 * self->_cellRsrp;
    if ((v6 & 0x200000) != 0)
    {
LABEL_48:
      uint64_t v81 = 2654435761 * self->_cellSinr;
      if ((v6 & 0x40) != 0) {
        goto LABEL_49;
      }
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v82 = 0;
    if ((v6 & 0x200000) != 0) {
      goto LABEL_48;
    }
  }
  uint64_t v81 = 0;
  if ((v6 & 0x40) != 0)
  {
LABEL_49:
    uint64_t v80 = 2654435761 * self->_btRssi;
    if ((v5 & 0x200) != 0) {
      goto LABEL_50;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v80 = 0;
  if ((v5 & 0x200) != 0)
  {
LABEL_50:
    uint64_t v79 = 2654435761 * self->_txRetransmissionRate;
    if ((v5 & 4) != 0) {
      goto LABEL_51;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v79 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_51:
    uint64_t v78 = 2654435761 * self->_rxRetransmissionRate;
    if ((v6 & 0x20000000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v78 = 0;
  if ((v6 & 0x20000000000) != 0)
  {
LABEL_52:
    uint64_t v77 = 2654435761 * self->_lqmScoreBT;
    if ((v5 & 0x8000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v77 = 0;
  if ((v5 & 0x8000000) != 0)
  {
LABEL_53:
    uint64_t v76 = 2654435761 * self->_wrmRecommendedRAT;
    if ((v6 & 4) != 0) {
      goto LABEL_54;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v76 = 0;
  if ((v6 & 4) != 0)
  {
LABEL_54:
    uint64_t v75 = 2654435761 * self->_actualLowBandwidth;
    if ((v6 & 2) != 0) {
      goto LABEL_55;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v75 = 0;
  if ((v6 & 2) != 0)
  {
LABEL_55:
    uint64_t v74 = 2654435761 * self->_actualHighBandwidth;
    if ((v6 & 0x80000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v74 = 0;
  if ((v6 & 0x80000000) != 0)
  {
LABEL_56:
    uint64_t v73 = 2654435761 * self->_estimatedLowBandwidth;
    if ((v6 & 0x40000000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v73 = 0;
  if ((v6 & 0x40000000) != 0)
  {
LABEL_57:
    uint64_t v72 = 2654435761 * self->_estimatedHighBandwidth;
    if ((v6 & 0x8000000000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v72 = 0;
  if ((v6 & 0x8000000000000) != 0)
  {
LABEL_58:
    uint64_t v71 = 2654435761 * self->_movingAvgLowBandwidth;
    if ((v6 & 0x4000000000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v71 = 0;
  if ((v6 & 0x4000000000000) != 0)
  {
LABEL_59:
    uint64_t v70 = 2654435761 * self->_movingAvgHighBandwidth;
    if ((v6 & 0x10000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v70 = 0;
  if ((v6 & 0x10000000) != 0)
  {
LABEL_60:
    uint64_t v69 = 2654435761 * self->_deviation;
    if ((v6 & 0x400000000000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v69 = 0;
  if ((v6 & 0x400000000000) != 0)
  {
LABEL_61:
    uint64_t v68 = 2654435761 * self->_maxOfActualLowBandwidth;
    if ((v6 & 0x800000000000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v68 = 0;
  if ((v6 & 0x800000000000000) != 0)
  {
LABEL_62:
    uint64_t v67 = 2654435761 * self->_pkgLifeTimeVO;
    if ((v6 & 0x8000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v67 = 0;
  if ((v6 & 0x8000000) != 0)
  {
LABEL_63:
    uint64_t v66 = 2654435761 * self->_decisionVO;
    if ((v6 & 0x4000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v66 = 0;
  if ((v6 & 0x4000000) != 0)
  {
LABEL_64:
    uint64_t v65 = 2654435761 * self->_decisionVIBE;
    if ((v5 & 0x800) != 0) {
      goto LABEL_65;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v65 = 0;
  if ((v5 & 0x800) != 0)
  {
LABEL_65:
    uint64_t v64 = 2654435761 * self->_videoStreamingStallTime;
    if ((v5 & 0x400) != 0) {
      goto LABEL_66;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v64 = 0;
  if ((v5 & 0x400) != 0)
  {
LABEL_66:
    uint64_t v63 = 2654435761 * self->_txber;
    if ((v5 & 8) != 0) {
      goto LABEL_67;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v63 = 0;
  if ((v5 & 8) != 0)
  {
LABEL_67:
    uint64_t v62 = 2654435761 * self->_rxRetry;
    if ((v5 & 0x2000) != 0) {
      goto LABEL_68;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v62 = 0;
  if ((v5 & 0x2000) != 0)
  {
LABEL_68:
    uint64_t v61 = 2654435761 * self->_weightedAveragePhyrateTx;
    if ((v5 & 0x1000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v61 = 0;
  if ((v5 & 0x1000) != 0)
  {
LABEL_69:
    uint64_t v60 = 2654435761 * self->_weightedAveragePhyrateRx;
    if ((v5 & 0x4000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v60 = 0;
  if ((v5 & 0x4000) != 0)
  {
LABEL_70:
    uint64_t v59 = 2654435761 * self->_weightedAverageRssi;
    if ((v5 & 0x8000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v59 = 0;
  if ((v5 & 0x8000) != 0)
  {
LABEL_71:
    uint64_t v58 = 2654435761 * self->_weightedAverageSnr;
    if ((v6 & 0x400000) != 0) {
      goto LABEL_72;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v58 = 0;
  if ((v6 & 0x400000) != 0)
  {
LABEL_72:
    uint64_t v57 = 2654435761 * self->_cmDataSentCount;
    if ((v6 & 0x800000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_110;
  }
LABEL_109:
  uint64_t v57 = 0;
  if ((v6 & 0x800000) != 0)
  {
LABEL_73:
    uint64_t v56 = 2654435761 * self->_cmDataSentDuration;
    if ((v6 & 0x1000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v56 = 0;
  if ((v6 & 0x1000000) != 0)
  {
LABEL_74:
    uint64_t v55 = 2654435761 * self->_cmEstimatedBandwidth;
    if ((v6 & 0x20000000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v55 = 0;
  if ((v6 & 0x20000000) != 0)
  {
LABEL_75:
    uint64_t v54 = 2654435761 * self->_devicePointOfInterest;
    if ((v5 & 2) != 0) {
      goto LABEL_76;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v54 = 0;
  if ((v5 & 2) != 0)
  {
LABEL_76:
    uint64_t v53 = 2654435761 * self->_rrcState;
    if ((v6 & 0x2000000000000) != 0) {
      goto LABEL_77;
    }
    goto LABEL_114;
  }
LABEL_113:
  uint64_t v53 = 0;
  if ((v6 & 0x2000000000000) != 0)
  {
LABEL_77:
    uint64_t v52 = 2654435761 * self->_mlPredictedWiFiBW;
    if ((v5 & 0x100000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v52 = 0;
  if ((v5 & 0x100000) != 0)
  {
LABEL_78:
    uint64_t v51 = 2654435761 * self->_wifiModelVersion;
    if ((v5 & 0x80000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_116;
  }
LABEL_115:
  uint64_t v51 = 0;
  if ((v5 & 0x80000) != 0)
  {
LABEL_79:
    uint64_t v50 = 2654435761 * self->_wifiModelConfidenceLevel;
    if ((v6 & 0x1000000000000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_117;
  }
LABEL_116:
  uint64_t v50 = 0;
  if ((v6 & 0x1000000000000) != 0)
  {
LABEL_80:
    uint64_t v49 = 2654435761 * self->_mlPredictedCellBW;
    if ((v6 & 0x10000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_118;
  }
LABEL_117:
  uint64_t v49 = 0;
  if ((v6 & 0x10000) != 0)
  {
LABEL_81:
    uint64_t v48 = 2654435761 * self->_cellModelVersion;
    if ((v6 & 0x8000) != 0) {
      goto LABEL_82;
    }
LABEL_119:
    uint64_t v47 = 0;
    if ((v6 & 0x2000) != 0) {
      goto LABEL_83;
    }
    goto LABEL_120;
  }
LABEL_118:
  uint64_t v48 = 0;
  if ((v6 & 0x8000) == 0) {
    goto LABEL_119;
  }
LABEL_82:
  uint64_t v47 = 2654435761 * self->_cellModelConfidenceLevel;
  if ((v6 & 0x2000) != 0)
  {
LABEL_83:
    uint64_t v46 = 2654435761 * self->_cellEstimatedBW;
    goto LABEL_121;
  }
LABEL_120:
  uint64_t v46 = 0;
LABEL_121:
  NSUInteger v45 = [(NSString *)self->_appType hash];
  int v7 = *((_DWORD *)&self->_has + 2);
  if ((v7 & 0x10) != 0)
  {
    uint64_t v44 = 2654435761 * self->_tcpRTTAvg;
    if ((v7 & 0x20) != 0) {
      goto LABEL_123;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((v7 & 0x20) != 0)
    {
LABEL_123:
      uint64_t v43 = 2654435761 * self->_tcpRTTmin;
      goto LABEL_126;
    }
  }
  uint64_t v43 = 0;
LABEL_126:
  uint64_t v8 = (uint64_t)self->_has;
  if ((v7 & 0x40) != 0)
  {
    uint64_t v42 = 2654435761 * self->_tcpRTTvar;
    if (v8 < 0)
    {
LABEL_128:
      uint64_t v41 = 2654435761 * self->_ratioDupeBytes;
      if (v7) {
        goto LABEL_129;
      }
      goto LABEL_162;
    }
  }
  else
  {
    uint64_t v42 = 0;
    if (v8 < 0) {
      goto LABEL_128;
    }
  }
  uint64_t v41 = 0;
  if (v7)
  {
LABEL_129:
    uint64_t v40 = 2654435761 * self->_ratioOOBBytes;
    if ((v8 & 0x400) != 0) {
      goto LABEL_130;
    }
    goto LABEL_163;
  }
LABEL_162:
  uint64_t v40 = 0;
  if ((v8 & 0x400) != 0)
  {
LABEL_130:
    uint64_t v39 = 2654435761 * self->_cellARFCN;
    if ((v8 & 0x1000) != 0) {
      goto LABEL_131;
    }
    goto LABEL_164;
  }
LABEL_163:
  uint64_t v39 = 0;
  if ((v8 & 0x1000) != 0)
  {
LABEL_131:
    uint64_t v38 = 2654435761 * self->_cellChannelBW;
    if ((v8 & 0x800) != 0) {
      goto LABEL_132;
    }
    goto LABEL_165;
  }
LABEL_164:
  uint64_t v38 = 0;
  if ((v8 & 0x800) != 0)
  {
LABEL_132:
    uint64_t v37 = 2654435761 * self->_cellBandInfo;
    if ((v8 & 0x200000000000) != 0) {
      goto LABEL_133;
    }
    goto LABEL_166;
  }
LABEL_165:
  uint64_t v37 = 0;
  if ((v8 & 0x200000000000) != 0)
  {
LABEL_133:
    uint64_t v36 = 2654435761 * self->_maxDLCAConfigured;
    if ((v8 & 0x800000000000) != 0) {
      goto LABEL_134;
    }
    goto LABEL_167;
  }
LABEL_166:
  uint64_t v36 = 0;
  if ((v8 & 0x800000000000) != 0)
  {
LABEL_134:
    uint64_t v9 = 2654435761 * self->_maxULCAConfigured;
    if ((v7 & 0x10000) != 0) {
      goto LABEL_135;
    }
    goto LABEL_168;
  }
LABEL_167:
  uint64_t v9 = 0;
  if ((v7 & 0x10000) != 0)
  {
LABEL_135:
    uint64_t v10 = 2654435761 * self->_wifChannelBW;
    if ((v7 & 0x20000) != 0) {
      goto LABEL_136;
    }
    goto LABEL_169;
  }
LABEL_168:
  uint64_t v10 = 0;
  if ((v7 & 0x20000) != 0)
  {
LABEL_136:
    uint64_t v11 = 2654435761 * self->_wifChannelType;
    if ((v7 & 0x40000) != 0) {
      goto LABEL_137;
    }
    goto LABEL_170;
  }
LABEL_169:
  uint64_t v11 = 0;
  if ((v7 & 0x40000) != 0)
  {
LABEL_137:
    uint64_t v12 = 2654435761 * self->_wifiCapability;
    if ((v8 & 0x100000000) != 0) {
      goto LABEL_138;
    }
    goto LABEL_171;
  }
LABEL_170:
  uint64_t v12 = 0;
  if ((v8 & 0x100000000) != 0)
  {
LABEL_138:
    uint64_t v13 = 2654435761 * self->_estimatedSpeed;
    if ((v7 & 0x10000000) != 0) {
      goto LABEL_139;
    }
    goto LABEL_172;
  }
LABEL_171:
  uint64_t v13 = 0;
  if ((v7 & 0x10000000) != 0)
  {
LABEL_139:
    uint64_t v14 = 2654435761 * self->_cellNsaEnabled;
    if ((v7 & 0x20000000) != 0) {
      goto LABEL_140;
    }
    goto LABEL_173;
  }
LABEL_172:
  uint64_t v14 = 0;
  if ((v7 & 0x20000000) != 0)
  {
LABEL_140:
    uint64_t v15 = 2654435761 * self->_isFR1;
    if ((v8 & 0x20000) != 0) {
      goto LABEL_141;
    }
    goto LABEL_174;
  }
LABEL_173:
  uint64_t v15 = 0;
  if ((v8 & 0x20000) != 0)
  {
LABEL_141:
    uint64_t v16 = 2654435761 * self->_cellNrRSRP;
    if ((v8 & 0x40000) != 0) {
      goto LABEL_142;
    }
    goto LABEL_175;
  }
LABEL_174:
  uint64_t v16 = 0;
  if ((v8 & 0x40000) != 0)
  {
LABEL_142:
    uint64_t v17 = 2654435761 * self->_cellNrRSRQ;
    if ((v8 & 0x80000) != 0) {
      goto LABEL_143;
    }
    goto LABEL_176;
  }
LABEL_175:
  uint64_t v17 = 0;
  if ((v8 & 0x80000) != 0)
  {
LABEL_143:
    uint64_t v18 = 2654435761 * self->_cellNrSNR;
    if ((v8 & 0x4000) != 0) {
      goto LABEL_144;
    }
    goto LABEL_177;
  }
LABEL_176:
  uint64_t v18 = 0;
  if ((v8 & 0x4000) != 0)
  {
LABEL_144:
    uint64_t v19 = 2654435761 * self->_cellLteRSRQ;
    if ((v8 & 0x80000000000000) != 0) {
      goto LABEL_145;
    }
    goto LABEL_178;
  }
LABEL_177:
  uint64_t v19 = 0;
  if ((v8 & 0x80000000000000) != 0)
  {
LABEL_145:
    uint64_t v20 = 2654435761 * self->_pActualLowBandwidth;
    if ((v7 & 0x2000000) != 0) {
      goto LABEL_146;
    }
    goto LABEL_179;
  }
LABEL_178:
  uint64_t v20 = 0;
  if ((v7 & 0x2000000) != 0)
  {
LABEL_146:
    uint64_t v21 = 2654435761 * self->_wifimcsindex;
    if ((v7 & 0x800000) != 0) {
      goto LABEL_147;
    }
    goto LABEL_180;
  }
LABEL_179:
  uint64_t v21 = 0;
  if ((v7 & 0x800000) != 0)
  {
LABEL_147:
    uint64_t v22 = 2654435761 * self->_wifiguardinterval;
    if ((v7 & 0x4000000) != 0) {
      goto LABEL_148;
    }
    goto LABEL_181;
  }
LABEL_180:
  uint64_t v22 = 0;
  if ((v7 & 0x4000000) != 0)
  {
LABEL_148:
    uint64_t v23 = 2654435761 * self->_wifinumberOfSpatialStreams;
    if ((v7 & 0x400000) != 0) {
      goto LABEL_149;
    }
    goto LABEL_182;
  }
LABEL_181:
  uint64_t v23 = 0;
  if ((v7 & 0x400000) != 0)
  {
LABEL_149:
    uint64_t v24 = 2654435761 * self->_wifichannel;
    if ((v7 & 0x1000000) != 0) {
      goto LABEL_150;
    }
    goto LABEL_183;
  }
LABEL_182:
  uint64_t v24 = 0;
  if ((v7 & 0x1000000) != 0)
  {
LABEL_150:
    uint64_t v25 = 2654435761 * self->_wifilowDataMode;
    if ((v8 & 0x10000000000) != 0) {
      goto LABEL_151;
    }
    goto LABEL_184;
  }
LABEL_183:
  uint64_t v25 = 0;
  if ((v8 & 0x10000000000) != 0)
  {
LABEL_151:
    uint64_t v26 = 2654435761 * self->_isWfiCaptive;
    if ((v8 & 0x80) != 0) {
      goto LABEL_152;
    }
    goto LABEL_185;
  }
LABEL_184:
  uint64_t v26 = 0;
  if ((v8 & 0x80) != 0)
  {
LABEL_152:
    uint64_t v27 = 2654435761 * self->_btWiFiCoexState;
    if ((v7 & 0x80) != 0) {
      goto LABEL_153;
    }
    goto LABEL_186;
  }
LABEL_185:
  uint64_t v27 = 0;
  if ((v7 & 0x80) != 0)
  {
LABEL_153:
    uint64_t v28 = 2654435761 * self->_totalConfiguredBw;
    if ((v8 & 0x10000000000000) != 0) {
      goto LABEL_154;
    }
    goto LABEL_187;
  }
LABEL_186:
  uint64_t v28 = 0;
  if ((v8 & 0x10000000000000) != 0)
  {
LABEL_154:
    uint64_t v29 = 2654435761 * self->_nrConfiguredBw;
    if ((v8 & 0x40000000000000) != 0) {
      goto LABEL_155;
    }
    goto LABEL_188;
  }
LABEL_187:
  uint64_t v29 = 0;
  if ((v8 & 0x40000000000000) != 0)
  {
LABEL_155:
    uint64_t v30 = 2654435761 * self->_nrTotalScheduledMimoLayers;
    if ((v7 & 0x100) != 0) {
      goto LABEL_156;
    }
    goto LABEL_189;
  }
LABEL_188:
  uint64_t v30 = 0;
  if ((v7 & 0x100) != 0)
  {
LABEL_156:
    uint64_t v31 = 2654435761 * self->_totalConfiguredMimoLayers;
    if ((v8 & 0x100000000000) != 0) {
      goto LABEL_157;
    }
    goto LABEL_190;
  }
LABEL_189:
  uint64_t v31 = 0;
  if ((v8 & 0x100000000000) != 0)
  {
LABEL_157:
    uint64_t v32 = 2654435761 * self->_lteMaxScheduledMimoLayersInACell;
    if ((v8 & 0x20000000000000) != 0) {
      goto LABEL_158;
    }
LABEL_191:
    uint64_t v33 = 0;
    if ((v8 & 0x2000000) != 0) {
      goto LABEL_159;
    }
LABEL_192:
    uint64_t v34 = 0;
    return v104 ^ v105 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v83 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  }
LABEL_190:
  uint64_t v32 = 0;
  if ((v8 & 0x20000000000000) == 0) {
    goto LABEL_191;
  }
LABEL_158:
  uint64_t v33 = 2654435761 * self->_nrMaxDlModulation;
  if ((v8 & 0x2000000) == 0) {
    goto LABEL_192;
  }
LABEL_159:
  uint64_t v34 = 2654435761 * self->_coldStartType;
  return v104 ^ v105 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v83 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x200000000) != 0)
  {
    self->_event = *((_DWORD *)a3 + 38);
    *(void *)&self->_has |= 0x200000000uLL;
    uint64_t v5 = *((void *)a3 + 50);
  }
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x100) != 0)
  {
    self->_bufferInterval = *((_DWORD *)a3 + 13);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v5 = *((void *)a3 + 50);
    int v6 = *((_DWORD *)a3 + 102);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_73;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_wifiRssi = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)a3 + 50);
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_phyRate = *((_DWORD *)a3 + 63);
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x4000000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_qbssLoad = *((_DWORD *)a3 + 67);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_cca = *((_DWORD *)a3 + 14);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)a3 + 50);
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_bcnPer = *((_DWORD *)a3 + 10);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)a3 + 50);
  int v6 = *((_DWORD *)a3 + 102);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_expectedThroughputVO = *((_DWORD *)a3 + 40);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((*((_DWORD *)a3 + 102) & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_wifiSinr = *((_DWORD *)a3 + 92);
  *((_DWORD *)&self->_has + 2) |= 0x200000u;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_pktLifeTimeVO = *((_DWORD *)a3 + 65);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x2000000000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_pktLossRateVO = *((_DWORD *)a3 + 66);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x200000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_lqmScoreWifi = *((_DWORD *)a3 + 47);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_packetLossRateVIBE = *((_DWORD *)a3 + 62);
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_expectedThroughputVIBE = *((_DWORD *)a3 + 39);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x100000000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_packetLifetimeVIBE = *((_DWORD *)a3 + 61);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_badDecisionsCounterVO = *((_DWORD *)a3 + 9);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_goodDecisionsCounterVO = *((_DWORD *)a3 + 42);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_20:
    if ((v5 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_invalidDecisionsCounterVO = *((_DWORD *)a3 + 44);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_21:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_badDecisionsCounterVIBE = *((_DWORD *)a3 + 8);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_goodDecisionsCounterVIBE = *((_DWORD *)a3 + 41);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)a3 + 50);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_90:
  self->_invalidDecisionsCounterVIBE = *((_DWORD *)a3 + 43);
  *(void *)&self->_has |= 0x4000000000uLL;
  if ((*((void *)a3 + 50) & 0x80000000000) != 0)
  {
LABEL_24:
    self->_lqmScorecellular = *((_DWORD *)a3 + 48);
    *(void *)&self->_has |= 0x80000000000uLL;
  }
LABEL_25:
  if (*((void *)a3 + 34)) {
    -[AWDThroughputEvaluation setRatType:](self, "setRatType:");
  }
  uint64_t v7 = *((void *)a3 + 50);
  if ((v7 & 0x100000) != 0)
  {
    self->_cellRsrp = *((_DWORD *)a3 + 25);
    *(void *)&self->_has |= 0x100000uLL;
    uint64_t v7 = *((void *)a3 + 50);
  }
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x200000) != 0)
  {
    self->_cellSinr = *((_DWORD *)a3 + 26);
    *(void *)&self->_has |= 0x200000uLL;
    uint64_t v7 = *((void *)a3 + 50);
    int v8 = *((_DWORD *)a3 + 102);
    if ((v7 & 0x40) == 0)
    {
LABEL_31:
      if ((v8 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_94;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  self->_btRssi = *((_DWORD *)a3 + 11);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x200) == 0)
  {
LABEL_32:
    if ((v8 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_txRetransmissionRate = *((_DWORD *)a3 + 80);
  *((_DWORD *)&self->_has + 2) |= 0x200u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_rxRetransmissionRate = *((_DWORD *)a3 + 73);
  *((_DWORD *)&self->_has + 2) |= 4u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_lqmScoreBT = *((_DWORD *)a3 + 46);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_35:
    if ((v7 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_wrmRecommendedRAT = *((_DWORD *)a3 + 98);
  *((_DWORD *)&self->_has + 2) |= 0x8000000u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 4) == 0)
  {
LABEL_36:
    if ((v7 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_actualLowBandwidth = *((_DWORD *)a3 + 5);
  *(void *)&self->_has |= 4uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 2) == 0)
  {
LABEL_37:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_actualHighBandwidth = *((_DWORD *)a3 + 4);
  *(void *)&self->_has |= 2uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_estimatedLowBandwidth = *((_DWORD *)a3 + 36);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_estimatedHighBandwidth = *((_DWORD *)a3 + 35);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_movingAvgLowBandwidth = *((_DWORD *)a3 + 56);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_movingAvgHighBandwidth = *((_DWORD *)a3 + 55);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_deviation = *((_DWORD *)a3 + 33);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_maxOfActualLowBandwidth = *((_DWORD *)a3 + 51);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_pkgLifeTimeVO = *((_DWORD *)a3 + 64);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_decisionVO = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x800) == 0) {
      goto LABEL_47;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_decisionVIBE = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x800) == 0)
  {
LABEL_47:
    if ((v8 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_videoStreamingStallTime = *((_DWORD *)a3 + 82);
  *((_DWORD *)&self->_has + 2) |= 0x800u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x400) == 0)
  {
LABEL_48:
    if ((v8 & 8) == 0) {
      goto LABEL_49;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_txber = *((_DWORD *)a3 + 81);
  *((_DWORD *)&self->_has + 2) |= 0x400u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 8) == 0)
  {
LABEL_49:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_rxRetry = *((_DWORD *)a3 + 74);
  *((_DWORD *)&self->_has + 2) |= 8u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x2000) == 0)
  {
LABEL_50:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_weightedAveragePhyrateTx = *((_DWORD *)a3 + 84);
  *((_DWORD *)&self->_has + 2) |= 0x2000u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x1000) == 0)
  {
LABEL_51:
    if ((v8 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_weightedAveragePhyrateRx = *((_DWORD *)a3 + 83);
  *((_DWORD *)&self->_has + 2) |= 0x1000u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x4000) == 0)
  {
LABEL_52:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_weightedAverageRssi = *((_DWORD *)a3 + 85);
  *((_DWORD *)&self->_has + 2) |= 0x4000u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x8000) == 0)
  {
LABEL_53:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_weightedAverageSnr = *((_DWORD *)a3 + 86);
  *((_DWORD *)&self->_has + 2) |= 0x8000u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_cmDataSentCount = *((_DWORD *)a3 + 27);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x800000) == 0)
  {
LABEL_55:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_cmDataSentDuration = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_cmEstimatedBandwidth = *((_DWORD *)a3 + 29);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_57:
    if ((v8 & 2) == 0) {
      goto LABEL_58;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_devicePointOfInterest = *((_DWORD *)a3 + 34);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 2) == 0)
  {
LABEL_58:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_rrcState = *((_DWORD *)a3 + 72);
  *((_DWORD *)&self->_has + 2) |= 2u;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_59:
    if ((v8 & 0x100000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_mlPredictedWiFiBW = *((_DWORD *)a3 + 54);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  int v8 = *((_DWORD *)a3 + 102);
  if ((v8 & 0x100000) == 0)
  {
LABEL_60:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_wifiModelVersion = *((_DWORD *)a3 + 91);
  *((_DWORD *)&self->_has + 2) |= 0x100000u;
  uint64_t v7 = *((void *)a3 + 50);
  if ((*((_DWORD *)a3 + 102) & 0x80000) == 0)
  {
LABEL_61:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_wifiModelConfidenceLevel = *((_DWORD *)a3 + 90);
  *((_DWORD *)&self->_has + 2) |= 0x80000u;
  uint64_t v7 = *((void *)a3 + 50);
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_mlPredictedCellBW = *((_DWORD *)a3 + 53);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  if ((v7 & 0x10000) == 0)
  {
LABEL_63:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_cellModelVersion = *((_DWORD *)a3 + 21);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v7 = *((void *)a3 + 50);
  if ((v7 & 0x8000) == 0)
  {
LABEL_64:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_126:
  self->_cellModelConfidenceLevel = *((_DWORD *)a3 + 20);
  *(void *)&self->_has |= 0x8000uLL;
  if ((*((void *)a3 + 50) & 0x2000) != 0)
  {
LABEL_65:
    self->_cellEstimatedBW = *((_DWORD *)a3 + 18);
    *(void *)&self->_has |= 0x2000uLL;
  }
LABEL_66:
  if (*((void *)a3 + 3)) {
    -[AWDThroughputEvaluation setAppType:](self, "setAppType:");
  }
  uint64_t v9 = (uint64_t *)((char *)a3 + 400);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x10) != 0)
  {
    self->_tcpRTTAvg = *((_DWORD *)a3 + 75);
    *((_DWORD *)&self->_has + 2) |= 0x10u;
    uint64_t v11 = *v9;
    int v10 = *((_DWORD *)a3 + 102);
    if ((v10 & 0x20) == 0) {
      goto LABEL_130;
    }
    goto LABEL_129;
  }
  uint64_t v11 = *v9;
  if ((v10 & 0x20) != 0)
  {
LABEL_129:
    self->_tcpRTTmin = *((_DWORD *)a3 + 76);
    *((_DWORD *)&self->_has + 2) |= 0x20u;
    uint64_t v11 = *((void *)a3 + 50);
    int v10 = *((_DWORD *)a3 + 102);
  }
LABEL_130:
  if ((v10 & 0x40) != 0)
  {
    self->_tcpRTTvar = *((_DWORD *)a3 + 77);
    *((_DWORD *)&self->_has + 2) |= 0x40u;
    uint64_t v11 = *((void *)a3 + 50);
    int v10 = *((_DWORD *)a3 + 102);
    if ((v11 & 0x8000000000000000) == 0)
    {
LABEL_132:
      if ((v10 & 1) == 0) {
        goto LABEL_133;
      }
      goto LABEL_167;
    }
  }
  else if ((v11 & 0x8000000000000000) == 0)
  {
    goto LABEL_132;
  }
  self->_ratioDupeBytes = *((_DWORD *)a3 + 70);
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 1) == 0)
  {
LABEL_133:
    if ((v11 & 0x400) == 0) {
      goto LABEL_134;
    }
    goto LABEL_168;
  }
LABEL_167:
  self->_ratioOOBBytes = *((_DWORD *)a3 + 71);
  *((_DWORD *)&self->_has + 2) |= 1u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x400) == 0)
  {
LABEL_134:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_cellARFCN = *((_DWORD *)a3 + 15);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x1000) == 0)
  {
LABEL_135:
    if ((v11 & 0x800) == 0) {
      goto LABEL_136;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_cellChannelBW = *((_DWORD *)a3 + 17);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x800) == 0)
  {
LABEL_136:
    if ((v11 & 0x200000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_cellBandInfo = *((_DWORD *)a3 + 16);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_137:
    if ((v11 & 0x800000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_maxDLCAConfigured = *((_DWORD *)a3 + 50);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x800000000000) == 0)
  {
LABEL_138:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_173;
  }
LABEL_172:
  self->_maxULCAConfigured = *((_DWORD *)a3 + 52);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x10000) == 0)
  {
LABEL_139:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_174;
  }
LABEL_173:
  self->_wifChannelBW = *((_DWORD *)a3 + 87);
  *((_DWORD *)&self->_has + 2) |= 0x10000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x20000) == 0)
  {
LABEL_140:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_175;
  }
LABEL_174:
  self->_wifChannelType = *((_DWORD *)a3 + 88);
  *((_DWORD *)&self->_has + 2) |= 0x20000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x40000) == 0)
  {
LABEL_141:
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_142;
    }
    goto LABEL_176;
  }
LABEL_175:
  self->_wifiCapability = *((_DWORD *)a3 + 89);
  *((_DWORD *)&self->_has + 2) |= 0x40000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_142:
    if ((v10 & 0x10000000) == 0) {
      goto LABEL_143;
    }
    goto LABEL_177;
  }
LABEL_176:
  self->_estimatedSpeed = *((_DWORD *)a3 + 37);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_143:
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_144;
    }
    goto LABEL_178;
  }
LABEL_177:
  self->_cellNsaEnabled = *((unsigned char *)a3 + 396);
  *((_DWORD *)&self->_has + 2) |= 0x10000000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_144:
    if ((v11 & 0x20000) == 0) {
      goto LABEL_145;
    }
    goto LABEL_179;
  }
LABEL_178:
  self->_isFR1 = *((unsigned char *)a3 + 397);
  *((_DWORD *)&self->_has + 2) |= 0x20000000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x20000) == 0)
  {
LABEL_145:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_180;
  }
LABEL_179:
  self->_cellNrRSRP = *((_DWORD *)a3 + 22);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x40000) == 0)
  {
LABEL_146:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_181;
  }
LABEL_180:
  self->_cellNrRSRQ = *((_DWORD *)a3 + 23);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x80000) == 0)
  {
LABEL_147:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_182;
  }
LABEL_181:
  self->_cellNrSNR = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x4000) == 0)
  {
LABEL_148:
    if ((v11 & 0x80000000000000) == 0) {
      goto LABEL_149;
    }
    goto LABEL_183;
  }
LABEL_182:
  self->_cellLteRSRQ = *((_DWORD *)a3 + 19);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_149:
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_184;
  }
LABEL_183:
  self->_pActualLowBandwidth = *((_DWORD *)a3 + 60);
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_150:
    if ((v10 & 0x800000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_185;
  }
LABEL_184:
  self->_wifimcsindex = *((_DWORD *)a3 + 96);
  *((_DWORD *)&self->_has + 2) |= 0x2000000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x800000) == 0)
  {
LABEL_151:
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_186;
  }
LABEL_185:
  self->_wifiguardinterval = *((_DWORD *)a3 + 94);
  *((_DWORD *)&self->_has + 2) |= 0x800000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_152:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_187;
  }
LABEL_186:
  self->_wifinumberOfSpatialStreams = *((_DWORD *)a3 + 97);
  *((_DWORD *)&self->_has + 2) |= 0x4000000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x400000) == 0)
  {
LABEL_153:
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_188;
  }
LABEL_187:
  self->_wifichannel = *((_DWORD *)a3 + 93);
  *((_DWORD *)&self->_has + 2) |= 0x400000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_154:
    if ((v11 & 0x10000000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_189;
  }
LABEL_188:
  self->_wifilowDataMode = *((_DWORD *)a3 + 95);
  *((_DWORD *)&self->_has + 2) |= 0x1000000u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_155:
    if ((v11 & 0x80) == 0) {
      goto LABEL_156;
    }
    goto LABEL_190;
  }
LABEL_189:
  self->_isWfiCaptive = *((_DWORD *)a3 + 45);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x80) == 0)
  {
LABEL_156:
    if ((v10 & 0x80) == 0) {
      goto LABEL_157;
    }
    goto LABEL_191;
  }
LABEL_190:
  self->_btWiFiCoexState = *((_DWORD *)a3 + 12);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v10 & 0x80) == 0)
  {
LABEL_157:
    if ((v11 & 0x10000000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_192;
  }
LABEL_191:
  self->_totalConfiguredBw = *((_DWORD *)a3 + 78);
  *((_DWORD *)&self->_has + 2) |= 0x80u;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x10000000000000) == 0)
  {
LABEL_158:
    if ((v11 & 0x40000000000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_193;
  }
LABEL_192:
  self->_nrConfiguredBw = *((_DWORD *)a3 + 57);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  int v10 = *((_DWORD *)a3 + 102);
  if ((v11 & 0x40000000000000) == 0)
  {
LABEL_159:
    if ((v10 & 0x100) == 0) {
      goto LABEL_160;
    }
    goto LABEL_194;
  }
LABEL_193:
  self->_nrTotalScheduledMimoLayers = *((_DWORD *)a3 + 59);
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  if ((*((_DWORD *)a3 + 102) & 0x100) == 0)
  {
LABEL_160:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_195;
  }
LABEL_194:
  self->_totalConfiguredMimoLayers = *((_DWORD *)a3 + 79);
  *((_DWORD *)&self->_has + 2) |= 0x100u;
  uint64_t v11 = *((void *)a3 + 50);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_161:
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_162;
    }
    goto LABEL_196;
  }
LABEL_195:
  self->_lteMaxScheduledMimoLayersInACell = *((_DWORD *)a3 + 49);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v11 = *((void *)a3 + 50);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_162:
    if ((v11 & 0x2000000) == 0) {
      return;
    }
    goto LABEL_163;
  }
LABEL_196:
  self->_nrMaxDlModulation = *((_DWORD *)a3 + 58);
  *(void *)&self->_has |= 0x20000000000000uLL;
  if ((*((void *)a3 + 50) & 0x2000000) == 0) {
    return;
  }
LABEL_163:
  self->_coldStartType = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x2000000uLL;
}

- (unsigned)event
{
  return self->_event;
}

- (unsigned)bufferInterval
{
  return self->_bufferInterval;
}

- (int64_t)wifiRssi
{
  return self->_wifiRssi;
}

- (unsigned)phyRate
{
  return self->_phyRate;
}

- (unsigned)qbssLoad
{
  return self->_qbssLoad;
}

- (unsigned)cca
{
  return self->_cca;
}

- (unsigned)bcnPer
{
  return self->_bcnPer;
}

- (unsigned)expectedThroughputVO
{
  return self->_expectedThroughputVO;
}

- (int)wifiSinr
{
  return self->_wifiSinr;
}

- (unsigned)pktLifeTimeVO
{
  return self->_pktLifeTimeVO;
}

- (unsigned)pktLossRateVO
{
  return self->_pktLossRateVO;
}

- (int)lqmScoreWifi
{
  return self->_lqmScoreWifi;
}

- (unsigned)packetLossRateVIBE
{
  return self->_packetLossRateVIBE;
}

- (unsigned)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (unsigned)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (unsigned)badDecisionsCounterVO
{
  return self->_badDecisionsCounterVO;
}

- (unsigned)goodDecisionsCounterVO
{
  return self->_goodDecisionsCounterVO;
}

- (unsigned)invalidDecisionsCounterVO
{
  return self->_invalidDecisionsCounterVO;
}

- (unsigned)badDecisionsCounterVIBE
{
  return self->_badDecisionsCounterVIBE;
}

- (unsigned)goodDecisionsCounterVIBE
{
  return self->_goodDecisionsCounterVIBE;
}

- (unsigned)invalidDecisionsCounterVIBE
{
  return self->_invalidDecisionsCounterVIBE;
}

- (int)lqmScorecellular
{
  return self->_lqmScorecellular;
}

- (NSString)ratType
{
  return self->_ratType;
}

- (void)setRatType:(id)a3
{
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (int)cellSinr
{
  return self->_cellSinr;
}

- (int)btRssi
{
  return self->_btRssi;
}

- (unsigned)txRetransmissionRate
{
  return self->_txRetransmissionRate;
}

- (unsigned)rxRetransmissionRate
{
  return self->_rxRetransmissionRate;
}

- (int)lqmScoreBT
{
  return self->_lqmScoreBT;
}

- (unsigned)wrmRecommendedRAT
{
  return self->_wrmRecommendedRAT;
}

- (unsigned)actualLowBandwidth
{
  return self->_actualLowBandwidth;
}

- (unsigned)actualHighBandwidth
{
  return self->_actualHighBandwidth;
}

- (unsigned)estimatedLowBandwidth
{
  return self->_estimatedLowBandwidth;
}

- (unsigned)estimatedHighBandwidth
{
  return self->_estimatedHighBandwidth;
}

- (unsigned)movingAvgLowBandwidth
{
  return self->_movingAvgLowBandwidth;
}

- (unsigned)movingAvgHighBandwidth
{
  return self->_movingAvgHighBandwidth;
}

- (int)deviation
{
  return self->_deviation;
}

- (unsigned)maxOfActualLowBandwidth
{
  return self->_maxOfActualLowBandwidth;
}

- (unsigned)pkgLifeTimeVO
{
  return self->_pkgLifeTimeVO;
}

- (unsigned)decisionVO
{
  return self->_decisionVO;
}

- (unsigned)decisionVIBE
{
  return self->_decisionVIBE;
}

- (unsigned)videoStreamingStallTime
{
  return self->_videoStreamingStallTime;
}

- (unsigned)txber
{
  return self->_txber;
}

- (unsigned)rxRetry
{
  return self->_rxRetry;
}

- (unsigned)weightedAveragePhyrateTx
{
  return self->_weightedAveragePhyrateTx;
}

- (unsigned)weightedAveragePhyrateRx
{
  return self->_weightedAveragePhyrateRx;
}

- (unsigned)weightedAverageRssi
{
  return self->_weightedAverageRssi;
}

- (unsigned)weightedAverageSnr
{
  return self->_weightedAverageSnr;
}

- (unsigned)cmDataSentCount
{
  return self->_cmDataSentCount;
}

- (unsigned)cmDataSentDuration
{
  return self->_cmDataSentDuration;
}

- (unsigned)cmEstimatedBandwidth
{
  return self->_cmEstimatedBandwidth;
}

- (unsigned)devicePointOfInterest
{
  return self->_devicePointOfInterest;
}

- (unsigned)rrcState
{
  return self->_rrcState;
}

- (unsigned)mlPredictedWiFiBW
{
  return self->_mlPredictedWiFiBW;
}

- (unsigned)wifiModelVersion
{
  return self->_wifiModelVersion;
}

- (unsigned)wifiModelConfidenceLevel
{
  return self->_wifiModelConfidenceLevel;
}

- (unsigned)mlPredictedCellBW
{
  return self->_mlPredictedCellBW;
}

- (unsigned)cellModelVersion
{
  return self->_cellModelVersion;
}

- (unsigned)cellModelConfidenceLevel
{
  return self->_cellModelConfidenceLevel;
}

- (unsigned)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (NSString)appType
{
  return self->_appType;
}

- (void)setAppType:(id)a3
{
}

- (unsigned)tcpRTTAvg
{
  return self->_tcpRTTAvg;
}

- (unsigned)tcpRTTmin
{
  return self->_tcpRTTmin;
}

- (unsigned)tcpRTTvar
{
  return self->_tcpRTTvar;
}

- (unsigned)ratioDupeBytes
{
  return self->_ratioDupeBytes;
}

- (unsigned)ratioOOBBytes
{
  return self->_ratioOOBBytes;
}

- (unsigned)cellARFCN
{
  return self->_cellARFCN;
}

- (unsigned)cellChannelBW
{
  return self->_cellChannelBW;
}

- (unsigned)cellBandInfo
{
  return self->_cellBandInfo;
}

- (unsigned)maxDLCAConfigured
{
  return self->_maxDLCAConfigured;
}

- (unsigned)maxULCAConfigured
{
  return self->_maxULCAConfigured;
}

- (unsigned)wifChannelBW
{
  return self->_wifChannelBW;
}

- (unsigned)wifChannelType
{
  return self->_wifChannelType;
}

- (unsigned)wifiCapability
{
  return self->_wifiCapability;
}

- (unsigned)estimatedSpeed
{
  return self->_estimatedSpeed;
}

- (BOOL)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (BOOL)isFR1
{
  return self->_isFR1;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (int)pActualLowBandwidth
{
  return self->_pActualLowBandwidth;
}

- (int)wifimcsindex
{
  return self->_wifimcsindex;
}

- (int)wifiguardinterval
{
  return self->_wifiguardinterval;
}

- (int)wifinumberOfSpatialStreams
{
  return self->_wifinumberOfSpatialStreams;
}

- (int)wifichannel
{
  return self->_wifichannel;
}

- (int)wifilowDataMode
{
  return self->_wifilowDataMode;
}

- (int)isWfiCaptive
{
  return self->_isWfiCaptive;
}

- (int)btWiFiCoexState
{
  return self->_btWiFiCoexState;
}

- (unsigned)totalConfiguredBw
{
  return self->_totalConfiguredBw;
}

- (unsigned)nrConfiguredBw
{
  return self->_nrConfiguredBw;
}

- (unsigned)nrTotalScheduledMimoLayers
{
  return self->_nrTotalScheduledMimoLayers;
}

- (unsigned)totalConfiguredMimoLayers
{
  return self->_totalConfiguredMimoLayers;
}

- (unsigned)lteMaxScheduledMimoLayersInACell
{
  return self->_lteMaxScheduledMimoLayersInACell;
}

- (unsigned)nrMaxDlModulation
{
  return self->_nrMaxDlModulation;
}

- (unsigned)coldStartType
{
  return self->_coldStartType;
}

@end