@interface SBSAInterfaceElementInertCollapsingTransitionSettings
- (void)_setDefaultValuesForBehaviorSettings:(id)a3;
@end

@implementation SBSAInterfaceElementInertCollapsingTransitionSettings

- (void)_setDefaultValuesForBehaviorSettings:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSAInterfaceElementInertCollapsingTransitionSettings;
  id v3 = a3;
  [(SBSystemApertureTransitionSettings *)&v4 _setDefaultValuesForBehaviorSettings:v3];
  objc_msgSend(v3, "setBehaviorType:", 1, v4.receiver, v4.super_class);
  [v3 setDampingRatio:0.816];
  [v3 setResponse:0.513];
  [v3 setRetargetImpulse:0.008];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end