@interface ClickabilityDetection
- (BOOL)clickable;
- (_TtC15UIUnderstanding21ClickabilityDetection)init;
- (_TtC15UIUnderstanding21ClickabilityDetection)initWithClickable:(BOOL)a3 clickType:(int64_t)a4 confidence:(double)a5;
- (double)confidence;
- (int64_t)clickType;
@end

@implementation ClickabilityDetection

- (BOOL)clickable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickable);
}

- (int64_t)clickType
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickType);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_confidence);
}

- (_TtC15UIUnderstanding21ClickabilityDetection)initWithClickable:(BOOL)a3 clickType:(int64_t)a4 confidence:(double)a5
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickable) = a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_clickType) = (Class)a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding21ClickabilityDetection_confidence) = a5;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClickabilityDetection();
  return [(ClickabilityDetection *)&v6 init];
}

- (_TtC15UIUnderstanding21ClickabilityDetection)init
{
  result = (_TtC15UIUnderstanding21ClickabilityDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end