@interface FocusDetection
- (BOOL)focused;
- (_TtC15UIUnderstanding14FocusDetection)init;
- (_TtC15UIUnderstanding14FocusDetection)initWithFocused:(BOOL)a3 confidence:(double)a4;
- (double)confidence;
@end

@implementation FocusDetection

- (BOOL)focused
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_focused);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_confidence);
}

- (_TtC15UIUnderstanding14FocusDetection)initWithFocused:(BOOL)a3 confidence:(double)a4
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_focused) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding14FocusDetection_confidence) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FocusDetection();
  return [(FocusDetection *)&v5 init];
}

- (_TtC15UIUnderstanding14FocusDetection)init
{
  result = (_TtC15UIUnderstanding14FocusDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end