@interface FMPlusButtonTableViewCell
- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation FMPlusButtonTableViewCell

- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy25FMPlusButtonTableViewCell *)sub_10008A3B8(v4, v5);
}

- (_TtC6FindMy25FMPlusButtonTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC6FindMy25FMPlusButtonTableViewCell_addButton;
  uint64_t v5 = qword_1006AE050;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v9[0] = xmmword_1006D18B0;
  v9[1] = *(_OWORD *)&qword_1006D18C0;
  v9[2] = xmmword_1006D18D0;
  id v7 = objc_allocWithZone((Class)type metadata accessor for FMAddButton());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_10022E220(0, 0xE000000000000000, v9);

  result = (_TtC6FindMy25FMPlusButtonTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPlusButtonTableViewCell_addButton));
}

@end