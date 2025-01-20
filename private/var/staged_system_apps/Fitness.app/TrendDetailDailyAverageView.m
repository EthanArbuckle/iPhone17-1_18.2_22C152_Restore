@interface TrendDetailDailyAverageView
- (HKUnit)accessibilityUnit;
- (NSArray)dayStops;
- (UILabel)titleLabel;
- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithCoder:(id)a3;
- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithFrame:(CGRect)a3;
- (id)accessibilityDayForStopIndex:(int64_t)a3;
- (id)accessibiliytQuantity365ForIndex:(int64_t)a3;
- (id)accessibiliytQuantity90ForIndex:(int64_t)a3;
- (void)layoutSubviews;
- (void)longPressWithSender:(id)a3;
- (void)setupFontsWithNote:(id)a3;
@end

@implementation TrendDetailDailyAverageView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_titleLabel));
}

- (NSArray)dayStops
{
  v2 = self;
  sub_100285AF0();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100286B54();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100289CE8();
}

- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC10FitnessApp27TrendDetailDailyAverageView)initWithFrame:(CGRect)a3
{
  result = (_TtC10FitnessApp27TrendDetailDailyAverageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_chartContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_container90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_container365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_textContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_gradientLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_barLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_gradientLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_barLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_chartMask));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_dayOfWeekStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_minAxisLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_midAxisLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_maxValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_div));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platterCenterLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_longPressRecognizer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSArray v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_platterCenterXConstraint);
}

- (void)longPressWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10028A93C(v4);
}

- (HKUnit)accessibilityUnit
{
  char v2 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_type);
  NSArray v3 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp27TrendDetailDailyAverageView_formattingManager)
                + OBJC_IVAR____TtC10FitnessApp23TrendsFormattingManager_fiuiFormatter);
  id v4 = self;
  result = (HKUnit *)[v3 unitManager];
  if (result)
  {
    uint64_t v6 = result;
    id v7 = sub_1005F20F4(result, v2);

    return (HKUnit *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)accessibilityDayForStopIndex:(int64_t)a3
{
  id v3 = sub_10028B7F0((id)a3);

  return v3;
}

- (id)accessibiliytQuantity90ForIndex:(int64_t)a3
{
  id v4 = self;
  uint64_t v5 = (void *)sub_10028B0F8(a3);

  return v5;
}

- (id)accessibiliytQuantity365ForIndex:(int64_t)a3
{
  id v4 = self;
  uint64_t v5 = (void *)sub_10028B27C(a3);

  return v5;
}

@end