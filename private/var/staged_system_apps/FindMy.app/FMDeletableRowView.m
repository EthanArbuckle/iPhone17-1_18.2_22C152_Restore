@interface FMDeletableRowView
- (_TtC6FindMy18FMDeletableRowView)initWithCoder:(id)a3;
- (_TtC6FindMy18FMDeletableRowView)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FMDeletableRowView

- (_TtC6FindMy18FMDeletableRowView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002F4864();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100006060(0, (unint64_t *)&qword_1006B0290);
  sub_1000C8370();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_1002F4430(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC6FindMy18FMDeletableRowView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy18FMDeletableRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy18FMDeletableRowView_image);
}

@end