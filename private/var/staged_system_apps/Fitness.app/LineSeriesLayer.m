@interface LineSeriesLayer
- (_TtC10FitnessApp15LineSeriesLayer)init;
- (_TtC10FitnessApp15LineSeriesLayer)initWithCoder:(id)a3;
- (_TtC10FitnessApp15LineSeriesLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation LineSeriesLayer

- (_TtC10FitnessApp15LineSeriesLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10FitnessApp15LineSeriesLayer *)sub_100641AC8((uint64_t)&v4);
}

- (_TtC10FitnessApp15LineSeriesLayer)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_100641F40();
}

- (_TtC10FitnessApp15LineSeriesLayer)init
{
  result = (_TtC10FitnessApp15LineSeriesLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_emptyGradientLayerPath));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_filledGradientLayerPath));

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp15LineSeriesLayer_gradientMask);
}

@end