@interface DefaultCell
- (_TtC7Measure11DefaultCell)initWithCoder:(id)a3;
- (_TtC7Measure11DefaultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DefaultCell

- (_TtC7Measure11DefaultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC7Measure11DefaultCell *)sub_10004E828(v4, v5);
}

- (_TtC7Measure11DefaultCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10004EC8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___stack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure11DefaultCell____lazy_storage___control));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11DefaultCell_def);
  uint64_t v4 = *(void *)&self->$__lazy_storage_$_stack[OBJC_IVAR____TtC7Measure11DefaultCell_def];

  sub_10004ED48(v3, v4);
}

@end