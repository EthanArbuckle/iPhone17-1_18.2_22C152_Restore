@interface RectangleFill
- (_TtC7Measure13RectangleFill)init;
- (_TtC7Measure13RectangleFill)initWithCoder:(id)a3;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation RectangleFill

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state);
}

- (void)setState:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state) = (Class)a3;
  if (v3 != a3)
  {
    v5 = self;
    sub_100188E08(a3);
  }
}

- (_TtC7Measure13RectangleFill)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_state) = (Class)1;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_currentPoints) = 0;
  uint64_t v5 = OBJC_IVAR____TtC7Measure13RectangleFill_rectangleFill;
  id v6 = objc_allocWithZone((Class)SCNNode);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Measure13RectangleFill *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Measure13RectangleFill)init
{
  result = (_TtC7Measure13RectangleFill *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure13RectangleFill_rectangleFill);
}

@end