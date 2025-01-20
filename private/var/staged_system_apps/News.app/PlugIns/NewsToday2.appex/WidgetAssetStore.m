@interface WidgetAssetStore
- (_TtC10NewsToday216WidgetAssetStore)init;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
@end

@implementation WidgetAssetStore

- (_TtC10NewsToday216WidgetAssetStore)init
{
  result = (_TtC10NewsToday216WidgetAssetStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100020AC0((uint64_t)self + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_infoService);
  v3 = (char *)self + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_directoryUrl;
  uint64_t v4 = sub_1000E8B60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore____lazy_storage___pruneThrottler));
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1000323E0((uint64_t)sub_1000323D8, v6);
  swift_unknownObjectRelease();

  swift_release();
}

@end