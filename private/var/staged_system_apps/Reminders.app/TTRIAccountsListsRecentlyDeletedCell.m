@interface TTRIAccountsListsRecentlyDeletedCell
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityDragSourceDescriptors;
- (NSArray)accessibilityDropPointDescriptors;
- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithCoder:(id)a3;
- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setAccessibilityCustomActions:(id)isa;
@end

@implementation TTRIAccountsListsRecentlyDeletedCell

- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *)sub_1002EE498(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell)initWithCoder:(id)a3
{
  result = (_TtC9Reminders36TTRIAccountsListsRecentlyDeletedCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  unint64_t v3 = sub_1002EE740();

  if (v3)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIAccountsListsRecentlyDeletedCell *)&v8 setAccessibilityCustomActions:isa];
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
}

@end