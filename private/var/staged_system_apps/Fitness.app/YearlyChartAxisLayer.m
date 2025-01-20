@interface YearlyChartAxisLayer
- (_TtC10FitnessApp20YearlyChartAxisLayer)init;
- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithCoder:(id)a3;
- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation YearlyChartAxisLayer

- (_TtC10FitnessApp20YearlyChartAxisLayer)init
{
  return (_TtC10FitnessApp20YearlyChartAxisLayer *)sub_1001E1E74();
}

- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC10FitnessApp20YearlyChartAxisLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v4 = [(YearlyChartAxisLayer *)self init];
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)&v6);
  return v4;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1001E2748();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_strokeLightColor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_strokeDarkColor));
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp20YearlyChartAxisLayer_gridPath);
}

@end