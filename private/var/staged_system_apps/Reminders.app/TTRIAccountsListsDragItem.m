@interface TTRIAccountsListsDragItem
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (_TtC9Reminders25TTRIAccountsListsDragItem)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation TTRIAccountsListsDragItem

- (_TtC9Reminders25TTRIAccountsListsDragItem)init
{
  result = (_TtC9Reminders25TTRIAccountsListsDragItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  sub_10003B754((uint64_t *)&unk_100791C60);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10066C6F0;
  if (qword_100785628 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_1007A1B78;
  *(void *)(v2 + 32) = qword_1007A1B70;
  *(void *)(v2 + 40) = v3;
  swift_bridgeObjectRetain();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  v12 = self;
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 internalErrorWithDebugDescription:v13];

  swift_willThrow();
  sub_1000C7ED8(v9, v11);
  if (a5)
  {
    v15 = (void *)_convertErrorToNSError(_:)();

    id v16 = v15;
    *a5 = v15;
  }
  else
  {
  }

  return 0;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  sub_1004E6A84();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (qword_100785628 != -1) {
    swift_once();
  }
  if (v3 == qword_1007A1B70 && v5 == *(void *)algn_1007A1B78)
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
  id v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  id v10 = sub_1004E6B74(v6, v8, (uint64_t)v9, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();

  return v10;
}

@end