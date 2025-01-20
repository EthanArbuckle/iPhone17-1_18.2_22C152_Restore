@interface ChartValueGesturalOverlayView
- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithCoder:(id)a3;
- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithFrame:(CGRect)a3;
- (void)gestureDidChangeWithSender:(id)a3;
@end

@implementation ChartValueGesturalOverlayView

- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29ChartValueGesturalOverlayView *)sub_1006BDD10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp29ChartValueGesturalOverlayView)initWithCoder:(id)a3
{
  return 0;
}

- (void)gestureDidChangeWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006BE8AC(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_labelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_colors));
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp29ChartValueGesturalOverlayView_dataSource);

  swift_bridgeObjectRelease();
}

@end