@interface StockListScrollTestCase
- (NSString)testName;
- (_TtC8StocksUI23StockListScrollTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
- (unint64_t)scrollDirection;
@end

@implementation StockListScrollTestCase

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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI23StockListScrollTestCase_aggregate);
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
  return 3;
}

- (unint64_t)scrollDirection
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8StocksUI23StockListScrollTestCase_scrollDirection);
}

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A84B684(v4);
  v7 = v6;

  return v7;
}

- (_TtC8StocksUI23StockListScrollTestCase)init
{
  return (_TtC8StocksUI23StockListScrollTestCase *)sub_20A882E30();
}

- (void).cxx_destruct
{
}

@end