@interface DeepFusionAddBackModulationBandData
@end

@implementation DeepFusionAddBackModulationBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->shadingSuppressionInversePower, 0);
  objc_storeStrong((id *)&self->clippingThresholdHigh, 0);
  objc_storeStrong((id *)&self->clippingThresholdLow, 0);
  objc_storeStrong((id *)&self->uvAlpha, 0);
  objc_storeStrong((id *)&self->yAlpha, 0);
  objc_storeStrong((id *)&self->ySlope, 0);
  objc_storeStrong((id *)&self->skyLumaSlope, 0);
  objc_storeStrong((id *)&self->skinUVSlope, 0);
  objc_storeStrong((id *)&self->skinYSlope, 0);
  objc_storeStrong((id *)&self->deghostingUVMinValue, 0);
  objc_storeStrong((id *)&self->deghostingYMinValue, 0);

  objc_storeStrong((id *)&self->flatnessThreshold, 0);
}

@end