@interface SBFFluidBehaviorSettings(HintCustomization)
- (uint64_t)_setDefaultButtonHintGeometryFastValues;
@end

@implementation SBFFluidBehaviorSettings(HintCustomization)

- (uint64_t)_setDefaultButtonHintGeometryFastValues
{
  [a1 setBehaviorType:2];
  [a1 setDampingRatio:0.7];
  [a1 setResponse:0.3];
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(a1, "setFrameRateRange:highFrameRateReason:", 1114149, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

@end