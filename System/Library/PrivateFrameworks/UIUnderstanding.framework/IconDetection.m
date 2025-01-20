@interface IconDetection
- (NSString)labelString;
- (_TtC15UIUnderstanding13IconDetection)init;
- (_TtC15UIUnderstanding13IconDetection)initWithLabel:(int64_t)a3 confidence:(double)a4;
- (double)confidence;
- (int64_t)label;
@end

@implementation IconDetection

- (int64_t)label
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_label);
}

- (NSString)labelString
{
  IconLabel.toString()();
  v2 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_confidence);
}

- (_TtC15UIUnderstanding13IconDetection)initWithLabel:(int64_t)a3 confidence:(double)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_label) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding13IconDetection_confidence) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IconDetection();
  return [(IconDetection *)&v5 init];
}

- (_TtC15UIUnderstanding13IconDetection)init
{
  result = (_TtC15UIUnderstanding13IconDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end