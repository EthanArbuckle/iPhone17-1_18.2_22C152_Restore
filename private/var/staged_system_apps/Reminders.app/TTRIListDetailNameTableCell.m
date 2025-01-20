@interface TTRIListDetailNameTableCell
- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithCoder:(id)a3;
- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)textFieldEditingDidBegin;
- (void)textFieldEditingDidEnd;
@end

@implementation TTRIListDetailNameTableCell

- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders27TTRIListDetailNameTableCell *)sub_1005DFDC8(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders27TTRIListDetailNameTableCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders27TTRIListDetailNameTableCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)textFieldEditingDidBegin
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders27TTRIListDetailNameTableCell_nameTextField);
  v3 = self;
  [v2 setAutocapitalizationType:1];
  sub_1005E0434();
}

- (void)textFieldEditingDidEnd
{
  v2 = self;
  sub_1005E0434();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders27TTRIListDetailNameTableCell_nameTextField);
}

@end