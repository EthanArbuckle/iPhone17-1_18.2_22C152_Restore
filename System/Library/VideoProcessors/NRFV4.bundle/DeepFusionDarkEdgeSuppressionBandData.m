@interface DeepFusionDarkEdgeSuppressionBandData
@end

@implementation DeepFusionDarkEdgeSuppressionBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->darkEdgeSupressionLumaDiffThreshold, 0);
  objc_storeStrong((id *)&self->darkEdgeSupressionLumaThresholdLow, 0);

  objc_storeStrong((id *)&self->darkEdgeSupressionLumaThresholdHigh, 0);
}

@end