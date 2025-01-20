@interface WidgetAssetStore
- (_TtC7NewsTag16WidgetAssetStore)init;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
@end

@implementation WidgetAssetStore

- (_TtC7NewsTag16WidgetAssetStore)init
{
  result = (_TtC7NewsTag16WidgetAssetStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000201A8((uint64_t)self + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_infoService);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_directoryUrl;
  uint64_t v4 = sub_1000CABE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore____lazy_storage___pruneThrottler));
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
  sub_100028C48((uint64_t)sub_100028C40, v6);
  swift_unknownObjectRelease();

  swift_release();
}

@end