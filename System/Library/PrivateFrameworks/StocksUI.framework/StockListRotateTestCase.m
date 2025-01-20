@interface StockListRotateTestCase
- (NSArray)requiredCapabilities;
- (NSString)testName;
- (_TtC8StocksUI23StockListRotateTestCase)init;
- (double)timeoutInSeconds;
- (int64_t)rotateOrientation;
- (unint64_t)aggregate;
@end

@implementation StockListRotateTestCase

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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockListRotateTestCase_aggregate);
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
                           + OBJC_IVAR____TtC8StocksUI23StockListRotateTestCase_rotateOrientation);
}

- (_TtC8StocksUI23StockListRotateTestCase)init
{
  return (_TtC8StocksUI23StockListRotateTestCase *)sub_20A58E56C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end