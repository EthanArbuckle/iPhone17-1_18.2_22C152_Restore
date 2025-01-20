@interface TTRIRemindersListTipCell
- (_TtC9Reminders24TTRIRemindersListTipCell)initWithCoder:(id)a3;
- (_TtC9Reminders24TTRIRemindersListTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIRemindersListTipCell

- (_TtC9Reminders24TTRIRemindersListTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v8 = [(TTRIRemindersListTipCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];

  v9 = v8;
  UITableViewCell.setSeparatorInsetType(_:)();
  v10 = v9;
  UITableViewCell.ttr_registerForRemindersListCellBackgroundConfiguration()();

  return v10;
}

- (_TtC9Reminders24TTRIRemindersListTipCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders24TTRIRemindersListTipCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end