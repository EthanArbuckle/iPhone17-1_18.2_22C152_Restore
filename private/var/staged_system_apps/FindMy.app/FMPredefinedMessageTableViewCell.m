@interface FMPredefinedMessageTableViewCell
- (BOOL)isSelected;
- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation FMPredefinedMessageTableViewCell

- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy32FMPredefinedMessageTableViewCell *)sub_1000F07B0(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy32FMPredefinedMessageTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell__style;
  uint64_t v5 = qword_1006ADF80;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (void *)qword_1006B1198;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)qword_1006B1198;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell_message);
  void *v8 = 0;
  v8[1] = 0;
  id v9 = v7;

  result = (_TtC6FindMy32FMPredefinedMessageTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPredefinedMessageTableViewCell();
  return [(FMPlatteredTableViewCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1000F0B34(a3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = self;
  sub_1000F0BEC(a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy32FMPredefinedMessageTableViewCell__style));

  swift_bridgeObjectRelease();
}

@end