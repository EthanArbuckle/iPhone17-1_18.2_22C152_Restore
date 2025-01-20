@interface ReticleAnimator
- (CAShapeLayer)reticleShapeLayer;
- (_TtC7Measure15ReticleAnimator)init;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation ReticleAnimator

- (CAShapeLayer)reticleShapeLayer
{
  return (CAShapeLayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC7Measure15ReticleAnimator_reticleShapeLayer));
}

- (_TtC7Measure15ReticleAnimator)init
{
  result = (_TtC7Measure15ReticleAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15ReticleAnimator_snapPointLayer);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10019F54C(v6, a4);
}

@end