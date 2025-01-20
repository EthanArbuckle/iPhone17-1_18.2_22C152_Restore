@interface TrendsScrubberPlatterView
+ (Class)layerClass;
- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithCoder:(id)a3;
- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithFrame:(CGRect)a3;
- (void)fontSizeChangedWithNote:(id)a3;
- (void)layoutSubviews;
@end

@implementation TrendsScrubberPlatterView

+ (Class)layerClass
{
  sub_10007E2D8(0, &qword_100967938);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp25TrendsScrubberPlatterView *)sub_10067973C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)fontSizeChangedWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100679B98();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10067A704();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_midConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_leadingConstaint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_trailingConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_platterColor);
}

@end