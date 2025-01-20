@interface StockFeedScrollTestCase
- (NSString)testName;
- (_TtC8StocksUI23StockFeedScrollTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
@end

@implementation StockFeedScrollTestCase

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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_aggregate);
}

- (int64_t)iterations
{
  return 2;
}

- (int64_t)offset
{
  return 15;
}

- (int64_t)numberOfScreens
{
  return 5;
}

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A4A0D14(v4);
  v7 = v6;

  return v7;
}

- (_TtC8StocksUI23StockFeedScrollTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_testName);
  *id v4 = 0x6565466B636F7453;
  v4[1] = 0xEF6C6C6F72635364;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedScrollTestCase_numberOfScreens) = (Class)5;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(StockFeedScrollTestCase *)&v6 init];
}

- (void).cxx_destruct
{
}

@end