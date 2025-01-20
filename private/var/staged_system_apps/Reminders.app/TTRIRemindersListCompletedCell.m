@interface TTRIRemindersListCompletedCell
- (NSArray)accessibilityElements;
- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIRemindersListCompletedCell

- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v8 = [(TTRIRemindersListCompletedCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];

  v9 = v8;
  [(TTRIRemindersListCompletedCell *)v9 _setIgnoresMultipleSelectionDuringEditing:1];
  v10 = v9;
  UITableViewCell.ttr_registerForRemindersListCellBackgroundConfiguration()();

  return v10;
}

- (_TtC9Reminders30TTRIRemindersListCompletedCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders30TTRIRemindersListCompletedCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  id v3 = [(TTRIRemindersListCompletedCell *)v2 contentView];
  id v4 = [v3 accessibilityElements];

  if (v4)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v5.super.isa = 0;
  }

  return (NSArray *)v5.super.isa;
}

@end