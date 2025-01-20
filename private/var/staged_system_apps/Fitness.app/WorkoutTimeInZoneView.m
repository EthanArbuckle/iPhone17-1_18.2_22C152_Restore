@interface WorkoutTimeInZoneView
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithCoder:(id)a3;
- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WorkoutTimeInZoneView

- (CGSize)intrinsicContentSize
{
  double v2 = INFINITY;
  double v3 = 33.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight) = 0;
  id v4 = a3;

  CGSize result = (_TtC10FitnessApp21WorkoutTimeInZoneView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v10 = v3;
    id v7 = [(WorkoutTimeInZoneView *)v6 traitCollection];
    [v7 displayScale];
    double v9 = v8;

    [v10 setConstant:1.0 / v9];
  }
}

- (_TtC10FitnessApp21WorkoutTimeInZoneView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10FitnessApp21WorkoutTimeInZoneView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_dividerHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_zoneNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_rangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21WorkoutTimeInZoneView_barContainerView));

  swift_bridgeObjectRelease();
}

@end