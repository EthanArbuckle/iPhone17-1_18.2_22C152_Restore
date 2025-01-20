@interface PaceFormatter
- (_TtC9SeymourUI13PaceFormatter)init;
- (_TtC9SeymourUI13PaceFormatter)initWithCoder:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation PaceFormatter

- (id)stringForObjectValue:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A8009F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  sub_239D0EAE4((uint64_t)v10);
  uint64_t v7 = v6;

  sub_239C25128((uint64_t)v10, &qword_268A1CB20);
  if (v7)
  {
    v8 = (void *)sub_23A7FF948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_TtC9SeymourUI13PaceFormatter)init
{
  return (_TtC9SeymourUI13PaceFormatter *)PaceFormatter.init()();
}

- (_TtC9SeymourUI13PaceFormatter)initWithCoder:(id)a3
{
  return (_TtC9SeymourUI13PaceFormatter *)PaceFormatter.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SeymourUI13PaceFormatter_minutesFormatter);
}

@end