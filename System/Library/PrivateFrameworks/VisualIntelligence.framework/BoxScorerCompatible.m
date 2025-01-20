@interface BoxScorerCompatible
- (_TtC18VisualIntelligence19BoxScorerCompatible)init;
- (_TtC18VisualIntelligence19BoxScorerCompatible)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6;
- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6;
@end

@implementation BoxScorerCompatible

- (_TtC18VisualIntelligence19BoxScorerCompatible)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6
{
  type metadata accessor for BoxScorer();
  swift_allocObject();
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC18VisualIntelligence19BoxScorerCompatible_boxScorer) = (Class)sub_1DCEC6394(a3, a4, a5, a6);

  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for BoxScorerCompatible();
  return [(BoxScorerCompatible *)&v13 init];
}

- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6
{
  v10 = self;
  sub_1DCEC6548(a3, a4, a5, a6);
  double v12 = v11;

  return v12;
}

- (_TtC18VisualIntelligence19BoxScorerCompatible)init
{
  result = (_TtC18VisualIntelligence19BoxScorerCompatible *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end