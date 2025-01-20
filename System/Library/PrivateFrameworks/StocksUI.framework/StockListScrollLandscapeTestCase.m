@interface StockListScrollLandscapeTestCase
- (BOOL)waitForCommitToFinish;
- (NSArray)requiredCapabilities;
- (NSString)testName;
- (_TtC8StocksUI32StockListScrollLandscapeTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (int64_t)orientation;
- (unint64_t)aggregate;
- (unint64_t)scrollDirection;
@end

@implementation StockListScrollLandscapeTestCase

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
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8StocksUI32StockListScrollLandscapeTestCase_aggregate);
}

- (NSArray)requiredCapabilities
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20A8CE5D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
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
                             + OBJC_IVAR____TtC8StocksUI32StockListScrollLandscapeTestCase_scrollDirection);
}

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8StocksUI32StockListScrollLandscapeTestCase_orientation);
}

- (BOOL)waitForCommitToFinish
{
  return 0;
}

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A84B684(v4);
  v7 = v6;

  return v7;
}

- (_TtC8StocksUI32StockListScrollLandscapeTestCase)init
{
  return (_TtC8StocksUI32StockListScrollLandscapeTestCase *)sub_20A84B504();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end