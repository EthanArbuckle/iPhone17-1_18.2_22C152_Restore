@interface TTRIListDetailBadgeCellTableCell
- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithCoder:(id)a3;
- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation TTRIListDetailBadgeCellTableCell

- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders32TTRIListDetailBadgeCellTableCell *)sub_100179B98(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders32TTRIListDetailBadgeCellTableCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders32TTRIListDetailBadgeCellTableCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIListDetailBadgeCellTableCell *)&v3 layoutSubviews];
  [v2 setSeparatorStyle:0];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRIListDetailBadgeCellTableCell_badgeView));
}

@end