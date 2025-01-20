@interface MoveModeSettingsViewControllerDiffableDataSource
- (_TtC10FitnessApp48MoveModeSettingsViewControllerDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
@end

@implementation MoveModeSettingsViewControllerDiffableDataSource

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v6 = self;
  id v7 = a3;
  v8 = self;
  id v9 = [v6 mainBundle];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 localizedStringForKey:v10 value:0 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v12;
}

- (_TtC10FitnessApp48MoveModeSettingsViewControllerDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  aBlock[4] = sub_10047D820;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1003A0CBC;
  aBlock[3] = &unk_1008C8550;
  v8 = _Block_copy(aBlock);
  id v9 = a3;
  swift_retain();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MoveModeSettingsViewControllerDiffableDataSource();
  NSString v10 = [(MoveModeSettingsViewControllerDiffableDataSource *)&v12 initWithTableView:v9 cellProvider:v8];

  swift_release();
  _Block_release(v8);
  return v10;
}

@end