@interface TTRIRemindersListDragSection
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (_TtC9Reminders28TTRIRemindersListDragSection)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation TTRIRemindersListDragSection

- (_TtC9Reminders28TTRIRemindersListDragSection)init
{
  result = (_TtC9Reminders28TTRIRemindersListDragSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  sub_10003B754((uint64_t *)&unk_100791C60);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10066C6F0;
  if (qword_100785718 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_1007A9E38;
  *(void *)(v2 + 32) = qword_1007A9E30;
  *(void *)(v2 + 40) = v3;
  v4 = self;
  swift_bridgeObjectRetain();
  id v5 = [v4 writableTypeIdentifiersForItemProvider];
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100569C10(v6);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (qword_100785718 != -1) {
    swift_once();
  }
  if (v3 == qword_1007A9E30 && v5 == *(void *)algn_1007A9E38)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 3;
    }
    else {
      return 0;
    }
  }
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  id v10 = sub_1005DFA30(v6, v8, (uint64_t)v9, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();

  return v10;
}

@end