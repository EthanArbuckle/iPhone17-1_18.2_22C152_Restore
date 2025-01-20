@interface StockFeedRotateTestCase
- (NSArray)requiredCapabilities;
- (NSString)testName;
- (_TtC8StocksUI23StockFeedRotateTestCase)init;
- (double)timeoutInSeconds;
- (int64_t)rotateOrientation;
- (unint64_t)aggregate;
@end

@implementation StockFeedRotateTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 60.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockFeedRotateTestCase_aggregate);
}

- (NSArray)requiredCapabilities
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20A8CE5D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (int64_t)rotateOrientation
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8StocksUI23StockFeedRotateTestCase_rotateOrientation);
}

- (_TtC8StocksUI23StockFeedRotateTestCase)init
{
  return (_TtC8StocksUI23StockFeedRotateTestCase *)sub_20A7AB5C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end