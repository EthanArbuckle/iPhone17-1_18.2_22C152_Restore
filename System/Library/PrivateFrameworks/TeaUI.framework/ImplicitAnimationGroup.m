@interface ImplicitAnimationGroup
- (BOOL)isReversed;
- (BOOL)isRunning;
- (_TtC5TeaUI22ImplicitAnimationGroup)init;
- (double)fractionComplete;
- (int64_t)state;
- (void)addCompletion:(id)a3;
- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)pauseAnimation;
- (void)setFractionComplete:(double)a3;
- (void)setReversed:(BOOL)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation ImplicitAnimationGroup

- (_TtC5TeaUI22ImplicitAnimationGroup)init
{
}

- (void).cxx_destruct
{
}

- (int64_t)state
{
  v2 = self;
  id v3 = ImplicitAnimationGroup.state.getter();

  return (int64_t)v3;
}

- (BOOL)isRunning
{
  v2 = self;
  unsigned __int8 v3 = ImplicitAnimationGroup.isRunning.getter();

  return v3 & 1;
}

- (BOOL)isReversed
{
  v2 = self;
  unsigned __int8 v3 = ImplicitAnimationGroup.isReversed.getter();

  return v3 & 1;
}

- (void)setReversed:(BOOL)a3
{
  v4 = self;
  ImplicitAnimationGroup.isReversed.setter(a3);
}

- (double)fractionComplete
{
  v2 = self;
  ImplicitAnimationGroup.fractionComplete.getter();
  double v4 = v3;

  return v4;
}

- (void)setFractionComplete:(double)a3
{
  double v4 = self;
  ImplicitAnimationGroup.fractionComplete.setter(a3);
}

- (void)startAnimation
{
  v2 = self;
  ImplicitAnimationGroup.startAnimation()();
}

- (void)startAnimationAfterDelay:(double)a3
{
  double v4 = self;
  ImplicitAnimationGroup.startAnimation(afterDelay:)(a3);
}

- (void)pauseAnimation
{
  v2 = self;
  ImplicitAnimationGroup.pauseAnimation()();
}

- (void)stopAnimation:(BOOL)a3
{
  double v4 = self;
  ImplicitAnimationGroup.stopAnimation(_:)(a3);
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  double v4 = self;
  ImplicitAnimationGroup.finishAnimation(at:)(a3);
}

- (void)addCompletion:(id)a3
{
  double v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  ImplicitAnimationGroup.addCompletion(_:)((uint64_t)sub_1B5F8532C, v5);

  swift_release();
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  ImplicitAnimationGroup.continueAnimation(withTimingParameters:durationFactor:)((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

@end