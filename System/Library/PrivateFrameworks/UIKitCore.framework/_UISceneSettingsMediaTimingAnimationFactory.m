@interface _UISceneSettingsMediaTimingAnimationFactory
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (CAMediaTimingFunction)_timingFunctionForAnimation;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (void)set_timingFunctionForAnimation:(id)a3;
@end

@implementation _UISceneSettingsMediaTimingAnimationFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (CAMediaTimingFunction)_timingFunctionForAnimation
{
  return self->__timingFunctionForAnimation;
}

- (void)set_timingFunctionForAnimation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end