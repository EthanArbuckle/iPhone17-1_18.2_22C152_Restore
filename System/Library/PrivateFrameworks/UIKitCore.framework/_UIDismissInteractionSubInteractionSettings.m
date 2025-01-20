@interface _UIDismissInteractionSubInteractionSettings
+ (id)settingsControllerModule;
- (UIViewSpringAnimationBehaviorSettings)updateSpring;
- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)initWithDefaultValues;
- (double)coneOfInfluenceLeftAngle;
- (double)coneOfInfluenceRightAngle;
- (double)dismissThreshold;
- (double)effectiveDistanceFactor;
- (double)hysteresisPadding;
- (double)minScale;
- (double)scaleDismissThreshold;
- (double)scaleStretchinessLowerBound;
- (double)scaleStretchinessUpperBound;
- (void)setConeOfInfluenceLeftAngle:(double)a3;
- (void)setConeOfInfluenceRightAngle:(double)a3;
- (void)setDefaultValues;
- (void)setDismissThreshold:(double)a3;
- (void)setEffectiveDistanceFactor:(double)a3;
- (void)setHysteresisPadding:(double)a3;
- (void)setMinScale:(double)a3;
- (void)setScaleDismissThreshold:(double)a3;
- (void)setScaleStretchinessLowerBound:(double)a3;
- (void)setScaleStretchinessUpperBound:(double)a3;
- (void)setUpdateSpring:(id)a3;
@end

@implementation _UIDismissInteractionSubInteractionSettings

- (UIViewSpringAnimationBehaviorSettings)updateSpring
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring));
}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)initWithDefaultValues
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)sub_185787D08();
}

- (void)setDefaultValues
{
  v2 = self;
  sub_185787E70();
}

- (void)setUpdateSpring:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring) = (Class)a3;
  id v3 = a3;
}

- (double)effectiveDistanceFactor
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_effectiveDistanceFactor);
}

- (void)setEffectiveDistanceFactor:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_effectiveDistanceFactor) = a3;
}

- (double)dismissThreshold
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_dismissThreshold);
}

- (void)setDismissThreshold:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_dismissThreshold) = a3;
}

- (double)scaleDismissThreshold
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleDismissThreshold);
}

- (void)setScaleDismissThreshold:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleDismissThreshold) = a3;
}

- (double)hysteresisPadding
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_hysteresisPadding);
}

- (void)setHysteresisPadding:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_hysteresisPadding) = a3;
}

- (double)coneOfInfluenceLeftAngle
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceLeftAngle);
}

- (void)setConeOfInfluenceLeftAngle:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceLeftAngle) = a3;
}

- (double)coneOfInfluenceRightAngle
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceRightAngle);
}

- (void)setConeOfInfluenceRightAngle:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_coneOfInfluenceRightAngle) = a3;
}

- (double)minScale
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_minScale);
}

- (void)setMinScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_minScale) = a3;
}

- (double)scaleStretchinessLowerBound
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessLowerBound);
}

- (void)setScaleStretchinessLowerBound:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessLowerBound) = a3;
}

- (double)scaleStretchinessUpperBound
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessUpperBound);
}

- (void)setScaleStretchinessUpperBound:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_scaleStretchinessUpperBound) = a3;
}

+ (id)settingsControllerModule
{
  sub_185968544();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit43_UIDismissInteractionSubInteractionSettings_updateSpring));
}

@end