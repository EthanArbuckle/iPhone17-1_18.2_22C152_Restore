@interface StockFeedMemoryTestCase
- (NSString)testName;
- (_TtC8StocksUI23StockFeedMemoryTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation StockFeedMemoryTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A5FB50C(v8, (uint64_t)sub_20A4419AC, v7);

  swift_release();
}

- (_TtC8StocksUI23StockFeedMemoryTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_testName);
  void *v4 = 0x6565466B636F7453;
  v4[1] = 0xEF79726F6D654D64;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedMemoryTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(StockFeedMemoryTestCase *)&v6 init];
}

- (void).cxx_destruct
{
}

@end