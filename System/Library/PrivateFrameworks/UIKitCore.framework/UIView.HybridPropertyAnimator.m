@interface UIView.HybridPropertyAnimator
- (BOOL)isReversed;
- (BOOL)isRunning;
- (UIViewFloatAnimatableProperty)progressValue;
- (_TtCE5UIKitCSo6UIView22HybridPropertyAnimator)init;
- (double)fractionComplete;
- (int64_t)state;
- (void)addAnimations:(id)a3;
- (void)addAnimations:(id)a3 delayFactor:(double)a4;
- (void)addCompletion:(id)a3;
- (void)addInProcessProgressAnimations:(id)a3;
- (void)addInProcessProgressKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5;
- (void)continueAnimationWithSpring:(id)a3;
- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)pauseAnimation;
- (void)setFractionComplete:(double)a3;
- (void)setReversed:(BOOL)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation UIView.HybridPropertyAnimator

- (UIViewFloatAnimatableProperty)progressValue
{
  return (UIViewFloatAnimatableProperty *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_progressValue));
}

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__state);
}

- (BOOL)isRunning
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isRunning);
}

- (BOOL)isReversed
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isReversed);
}

- (void)setReversed:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__isReversed) = a3;
}

- (double)fractionComplete
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator__fractionComplete);
}

- (void)setFractionComplete:(double)a3
{
  v4 = self;
  sub_185AF0D94(a3);
}

- (void)startAnimation
{
  v2 = self;
  sub_185AF0BF0();
}

- (void)startAnimationAfterDelay:(double)a3
{
}

- (void)pauseAnimation
{
  v2 = self;
  sub_185AF0890();
}

- (void)stopAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_185AF0E4C((id)v3);
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  v4 = self;
  sub_185AF0F48(a3);
}

- (void)addAnimations:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_18557A3E4;
  v8[4] = v5;
  v11[4] = sub_185AF378C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1856A95EC;
  v11[3] = &block_descriptor_94;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_addAnimations_delayFactor_, v9, 0.0);
  _Block_release(v9);

  swift_release();
}

- (void)addAnimations:(id)a3 delayFactor:(double)a4
{
  v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = sub_18557A3E8;
  v10[4] = v7;
  v13[4] = sub_1858E670C;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1856A95EC;
  v13[3] = &block_descriptor_75_0;
  v11 = _Block_copy(v13);
  v12 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_addAnimations_delayFactor_, v11, a4);
  _Block_release(v11);

  swift_release();
}

- (void)addCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1858F3968;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void **)((char *)self + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_completionHandlers);
  swift_beginAccess();
  v8 = *v7;
  uint64_t v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1859184FC(0, v8[2] + 1, 1, v8);
    *uint64_t v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1859184FC((void *)(v11 > 1), v12 + 1, 1, v8);
    *uint64_t v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_185AF3490;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_springBehavior);
  if (v5)
  {
    swift_unknownObjectRetain();
    uint64_t v6 = self;
    id v7 = v5;
  }
  else
  {
    v8 = self;
    swift_unknownObjectRetain();
    uint64_t v9 = self;
    id v10 = objc_msgSend(v8, sel_parallaxSettings);
    id v7 = objc_msgSend(v10, sel_interactiveSpring);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_185AF3120((uint64_t)v7, self);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)addInProcessProgressAnimations:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_185AF1A14((uint64_t)sub_185AF3730, v5);

  swift_release();
}

- (void)addInProcessProgressKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = self;
  sub_185AF2C4C((uint64_t)sub_18557A3F0, v9, a3, a4);

  swift_release();
}

- (void)continueAnimationWithSpring:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_185AF3120((uint64_t)a3, v5);
  swift_unknownObjectRelease();
}

- (_TtCE5UIKitCSo6UIView22HybridPropertyAnimator)init
{
  result = (_TtCE5UIKitCSo6UIView22HybridPropertyAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo6UIView22HybridPropertyAnimator_propertyAnimator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end