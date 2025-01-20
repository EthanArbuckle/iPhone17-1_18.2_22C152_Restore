@interface _UIPointerLiftEffectSettings
+ (BOOL)pointerSlipMatchesContentSlip;
- (void)setDefaultValues;
@end

@implementation _UIPointerLiftEffectSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointerLiftEffectSettings;
  [(_UIPointerEffectSettings *)&v3 setDefaultValues];
  [(_UIPointerEffectSettings *)self setSlipFactorX:0.055];
  [(_UIPointerEffectSettings *)self setSlipFactorY:0.055];
  [(_UIPointerEffectSettings *)self setScaleUpPoints:7.6];
  [(_UIPointerEffectSettings *)self setParallaxAmount:1.0];
  [(_UIPointerEffectSettings *)self setDefaultPointerCornerRadius:0.0];
}

+ (BOOL)pointerSlipMatchesContentSlip
{
  return 1;
}

@end