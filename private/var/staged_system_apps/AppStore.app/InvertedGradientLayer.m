@interface InvertedGradientLayer
- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)init;
- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InvertedGradientLayer

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_1004621E8(v4);
}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_textDirection) = (Class)3;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  return [(InvertedGradientLayer *)&v3 init];
}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_lineHeight) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientStart) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_gradientEnd) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer_textDirection) = (Class)3;
  sub_100081D90(v8, v8[3]);
  uint64_t v4 = _bridgeAnythingToObjectiveC<A>(_:)();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedGradientLayer();
  v5 = [(InvertedGradientLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer)initWithCoder:(id)a3
{
  return (_TtC8AppStoreP33_94B25735D188DA0572222549F0689D5E21InvertedGradientLayer *)sub_10046280C(a3);
}

@end