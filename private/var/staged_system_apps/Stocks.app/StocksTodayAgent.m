@interface StocksTodayAgent
- (_TtC9StocksApp16StocksTodayAgent)init;
- (id)bundleSubscriptionDidSubscribe:(uint64_t)a1;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)dealloc;
- (void)markPurchaseDirty;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
@end

@implementation StocksTodayAgent

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1000097F0((uint64_t)sub_1000162B4, v6);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(StocksTodayAgent *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
}

- (_TtC9StocksApp16StocksTodayAgent)init
{
  result = (_TtC9StocksApp16StocksTodayAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)bundleSubscriptionDidSubscribe:(uint64_t)a1
{
  id result = *(id *)(a1 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (result) {
    return [result tickleWithQualityOfService:9 data:1 completion:0];
  }
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v4) {
    [v4 tickleWithQualityOfService:9 data:1 completion:0];
  }
  else {
    __break(1u);
  }
}

- (void)markPurchaseDirty
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v2) {
    [v2 tickleWithQualityOfService:9 data:1 completion:0];
  }
  else {
    __break(1u);
  }
}

@end