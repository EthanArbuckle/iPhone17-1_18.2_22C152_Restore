@interface SyntheticReferenceDSRBandData
@end

@implementation SyntheticReferenceDSRBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edgeGhostBoost, 0);
  objc_storeStrong((id *)&self->edgeThresholdEnd, 0);
  objc_storeStrong((id *)&self->edgeThresholdStart, 0);
  objc_storeStrong((id *)&self->shadowSigmaCorrectionNode1, 0);
  objc_storeStrong((id *)&self->shadowSigmaCorrectionNode0, 0);
  objc_storeStrong((id *)&self->clrMatchThresholdEnd, 0);
  objc_storeStrong((id *)&self->clrMatchThresholdStart, 0);
  objc_storeStrong((id *)&self->edgeMatchThresholdEnd, 0);
  objc_storeStrong((id *)&self->edgeMatchThresholdStart, 0);
  objc_storeStrong((id *)&self->ev0DeepShadowSmoothStepEnd, 0);

  objc_storeStrong((id *)&self->ev0DeepShadowSmoothStepStart, 0);
}

@end