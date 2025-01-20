@interface TTRIRemindersBoardColumnDragItem
+ (Class)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (_TtC9Reminders32TTRIRemindersBoardColumnDragItem)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation TTRIRemindersBoardColumnDragItem

- (_TtC9Reminders32TTRIRemindersBoardColumnDragItem)init
{
  result = (_TtC9Reminders32TTRIRemindersBoardColumnDragItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
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

+ (Class)readableTypeIdentifiersForItemProvider
{
  sub_10003B754((uint64_t *)&unk_100791C60);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10066C6F0;
  if (qword_1007853F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_100795918;
  *(void *)(v0 + 32) = qword_100795910;
  *(void *)(v0 + 40) = v1;
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  id v7 = (void *)sub_1002ABBEC((uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

@end