@interface TrendDetailChartView
- (HKUnit)accessibilityUnit;
- (NSArray)barStops;
- (UILabel)chartMaxLabel;
- (UILabel)titleLabel;
- (_TtC10FitnessApp20TrendDetailChartView)initWithCoder:(id)a3;
- (_TtC10FitnessApp20TrendDetailChartView)initWithFrame:(CGRect)a3;
- (id)accessibilityDateIntervalForIndex:(int64_t)a3;
- (id)accessibilityQuantityForIndex:(int64_t)a3;
- (void)layoutSubviews;
- (void)longPressWithSender:(id)a3;
- (void)setBarStops:(id)a3;
- (void)setupFontsWithNote:(id)a3;
@end

@implementation TrendDetailChartView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_titleLabel));
}

- (UILabel)chartMaxLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMaxLabel));
}

- (NSArray)barStops
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setBarStops:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barStops) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)setupFontsWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1006E1F3C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)layoutSubviews
{
  NSArray v2 = self;
  sub_1006E566C();
}

- (_TtC10FitnessApp20TrendDetailChartView)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC10FitnessApp20TrendDetailChartView)initWithFrame:(CGRect)a3
{
  result = (_TtC10FitnessApp20TrendDetailChartView *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMaxLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_container365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_container90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_gradientLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_gradientLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_barLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_lineLayer90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_lineLayer365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_averagePlatter365));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_averagePlatter90));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_chartMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpole));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_axisYearLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_monthLabelsStackView));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_firstFirstOfMonth, &qword_100969B30);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_januaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_stackViewLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_stackViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_yearLabelLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter90CenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter90CenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter365CenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_platter365CenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpoleBottomConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_scrubberFlagpoleCenterXConstraint);
}

- (void)longPressWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1006E72C4(v4);
}

- (HKUnit)accessibilityUnit
{
  char v2 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_type);
  v3 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp20TrendDetailChartView_formattingManager)
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

- (id)accessibilityDateIntervalForIndex:(int64_t)a3
{
  uint64_t v5 = sub_1000AFA94((uint64_t *)&unk_1009546B0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1006E8214(a3, (uint64_t)v7);

  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v9 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }

  return isa;
}

- (id)accessibilityQuantityForIndex:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_1006E8764(a3);

  return v5;
}

@end