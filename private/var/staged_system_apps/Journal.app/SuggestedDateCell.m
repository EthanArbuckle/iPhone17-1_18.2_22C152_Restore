@interface SuggestedDateCell
- (_TtC7Journal17SuggestedDateCell)initWithCoder:(id)a3;
- (_TtC7Journal17SuggestedDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SuggestedDateCell

- (_TtC7Journal17SuggestedDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Journal17SuggestedDateCell *)sub_10031925C(v4, v5);
}

- (_TtC7Journal17SuggestedDateCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7Journal17SuggestedDateCell_popupMenuButton;
  uint64_t v5 = qword_1007F6DD8;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)[objc_allocWithZone((Class)UIButton) initWithFrame:0.0, 0.0, xmmword_100807FC8];
  *(void *)&self->popupMenuButton[OBJC_IVAR____TtC7Journal17SuggestedDateCell_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC7Journal17SuggestedDateCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal17SuggestedDateCell_popupMenuButton));
  v3 = (char *)self + OBJC_IVAR____TtC7Journal17SuggestedDateCell_delegate;

  sub_1000109BC((uint64_t)v3);
}

@end