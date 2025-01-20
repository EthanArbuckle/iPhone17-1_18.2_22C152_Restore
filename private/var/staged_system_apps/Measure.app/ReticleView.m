@interface ReticleView
- (_TtC7Measure11ReticleView)initWithCoder:(id)a3;
- (_TtC7Measure11ReticleView)initWithFrame:(CGRect)a3;
- (_TtC7Measure15ReticleAnimator)animator;
- (float)currentDiameter;
- (int64_t)state;
- (void)setAnimator:(id)a3;
- (void)setCurrentDiameter:(float)a3;
- (void)setState:(int64_t)a3;
- (void)updateForCurrentOrientation;
@end

@implementation ReticleView

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView__state);
}

- (void)setState:(int64_t)a3
{
  v4 = self;
  sub_1001A3CC0(a3);
}

- (float)currentDiameter
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_currentDiameter);
}

- (void)setCurrentDiameter:(float)a3
{
  *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_currentDiameter) = a3;
}

- (_TtC7Measure15ReticleAnimator)animator
{
  return (_TtC7Measure15ReticleAnimator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC7Measure11ReticleView_animator));
}

- (void)setAnimator:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_animator);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_animator) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure11ReticleView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure11ReticleView *)sub_1001A4100(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure11ReticleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A6FC0();
}

- (void)updateForCurrentOrientation
{
  id v3 = self;
  v6 = self;
  id v4 = [v3 currentDevice];
  id v5 = [v4 orientation];

  sub_1001A3EB0((unint64_t)v5);
}

- (void).cxx_destruct
{
  sub_1000DB3D4((uint64_t)self + OBJC_IVAR____TtC7Measure11ReticleView_snapTimestamp);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11ReticleView_animator);
}

@end