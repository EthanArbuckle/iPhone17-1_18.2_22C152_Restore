@interface WRM_StreamingMetrics
- (WRM_StreamingMetrics)init;
- (void)dealloc;
@end

@implementation WRM_StreamingMetrics

- (WRM_StreamingMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_StreamingMetrics;
  result = [(WRM_StreamingMetrics *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mStreaming.timestamp = 0u;
    *(_OWORD *)&result->mStreaming.total_configured_mimo_layers = 0u;
    *(_OWORD *)&result->mStreaming.numStall = 0u;
    *(_OWORD *)&result->mStreaming.cellChannelBW = 0u;
    *(_OWORD *)&result->mStreaming.mac_DLCA_configured = 0u;
    *(_OWORD *)&result->mStreaming.cellNsaEnabled = 0u;
    *(_OWORD *)&result->mStreaming.cellLteRSRQ = 0u;
    *(_OWORD *)&result->mStreaming.wifinumberOfSpatialStreams = 0u;
    *(_OWORD *)&result->mStreaming.tcpRTTmin = 0u;
    *(_OWORD *)&result->mStreaming.coldStartTypeCellular = 0u;
    *(_OWORD *)&result->mStreaming.btWiFiCoexState = 0u;
    *(_OWORD *)&result->mStreaming.lqmScoreBT = 0u;
    *(_OWORD *)&result->mStreaming.wifiModelConfidenceLevel = 0u;
    *(_OWORD *)&result->mStreaming.devicePointOfInterest = 0u;
    *(_OWORD *)&result->mStreaming.rrcState = 0u;
    *(_OWORD *)&result->mStreaming.pkgLifeTimeVO = 0u;
    *(_OWORD *)&result->mStreaming.weightedAverageRssi = 0u;
    *(_OWORD *)&result->mStreaming.goodDecisionsCounterVO = 0u;
    *(_OWORD *)&result->mStreaming.invalidDecisionCounter = 0u;
    *(_OWORD *)&result->mStreaming.wifiRssi = 0u;
    *(_OWORD *)&result->mStreaming.StationCount = 0u;
    *(_OWORD *)&result->mStreaming.maxOfActualLowBandwidth = 0u;
    *(_OWORD *)&result->mStreaming.movingAvgHighBandwidth = 0u;
    *(_OWORD *)&result->mStreaming.buffer_interval = 0u;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_StreamingMetrics;
  [(WRM_StreamingMetrics *)&v2 dealloc];
}

@end