@interface TTRIRemindersListSharingStatusCellTableViewCell
- (NSArray)accessibilityDragSourceDescriptors;
- (NSArray)accessibilityDropPointDescriptors;
- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithCoder:(id)a3;
- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIRemindersListSharingStatusCellTableViewCell

- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell *)sub_10050BE2C(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)0;
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_stackedAvatarsView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders47TTRIRemindersListSharingStatusCellTableViewCell_statusLabel);
}

@end