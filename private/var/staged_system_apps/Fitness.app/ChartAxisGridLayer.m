@interface ChartAxisGridLayer
- (_TtC10FitnessApp18ChartAxisGridLayer)init;
- (_TtC10FitnessApp18ChartAxisGridLayer)initWithCoder:(id)a3;
- (_TtC10FitnessApp18ChartAxisGridLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation ChartAxisGridLayer

- (_TtC10FitnessApp18ChartAxisGridLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10FitnessApp18ChartAxisGridLayer *)sub_10025D240((uint64_t)&v4);
}

- (_TtC10FitnessApp18ChartAxisGridLayer)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_10025D57C();
}

- (_TtC10FitnessApp18ChartAxisGridLayer)init
{
  result = (_TtC10FitnessApp18ChartAxisGridLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18ChartAxisGridLayer_overlayStrokeColor));

  swift_bridgeObjectRelease();
}

@end