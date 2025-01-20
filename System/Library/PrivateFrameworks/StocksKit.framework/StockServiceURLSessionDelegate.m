@interface StockServiceURLSessionDelegate
- (_TtC9StocksKit30StockServiceURLSessionDelegate)init;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
@end

@implementation StockServiceURLSessionDelegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23BAACDB0(v4);
}

- (_TtC9StocksKit30StockServiceURLSessionDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC9StocksKit30StockServiceURLSessionDelegate_sessionDidFinishObservers) = (Class)MEMORY[0x263F8EE78];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(StockServiceURLSessionDelegate *)&v5 init];
}

- (void).cxx_destruct
{
}

@end