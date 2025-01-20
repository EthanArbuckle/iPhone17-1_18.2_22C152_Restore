@interface EntryCell
- (_TtC7Journal9EntryCell)initWithCoder:(id)a3;
- (_TtC7Journal9EntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation EntryCell

- (_TtC7Journal9EntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC7Journal9EntryCell *)sub_10027F648(a3, (uint64_t)a4, v6);
}

- (_TtC7Journal9EntryCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100282820();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal9EntryCell_lblCount);
}

@end