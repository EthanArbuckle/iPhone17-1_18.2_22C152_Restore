@interface SyntheticLongBandData
@end

@implementation SyntheticLongBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->adaptiveFusionReductionThreshold, 0);
  objc_storeStrong((id *)&self->adaptiveBlackFusionBoostThreshold, 0);
  objc_storeStrong((id *)&self->edgeThresholdChroma, 0);
  objc_storeStrong((id *)&self->edgeThresholdLuma, 0);
  objc_storeStrong((id *)&self->thresholdChroma, 0);

  objc_storeStrong((id *)&self->thresholdLuma, 0);
}

@end