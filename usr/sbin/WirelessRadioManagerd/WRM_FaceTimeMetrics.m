@interface WRM_FaceTimeMetrics
- (WRM_FaceTimeMetrics)init;
- (void)dealloc;
@end

@implementation WRM_FaceTimeMetrics

- (WRM_FaceTimeMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_FaceTimeMetrics;
  result = [(WRM_FaceTimeMetrics *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mFaceTime.audioErasure = 0u;
    *(_OWORD *)&result->mFaceTime.cellRsrp = 0u;
    *(_OWORD *)&result->mFaceTime.signalBar = 0u;
    *(_OWORD *)&result->mFaceTime.facetimeDelay = 0u;
    *(_OWORD *)&result->mFaceTime.iRATRecommendationReason = 0u;
    *(_OWORD *)&result->mFaceTime.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&result->mFaceTime.wifiTxPER = 0u;
    *(_OWORD *)&result->mFaceTime.cca = 0u;
    *(_OWORD *)&result->mFaceTime.wifiRssi = 0u;
    *(_OWORD *)&result->mFaceTime.timestamp = 0u;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_FaceTimeMetrics;
  [(WRM_FaceTimeMetrics *)&v2 dealloc];
}

@end