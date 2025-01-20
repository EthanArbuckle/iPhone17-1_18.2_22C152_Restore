@interface StockFeedScrollLandscapeTestCase
- (BOOL)waitForCommitToFinish;
- (NSArray)requiredCapabilities;
- (NSString)testName;
- (_TtC8StocksUI32StockFeedScrollLandscapeTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (int64_t)orientation;
- (unint64_t)aggregate;
@end

@implementation StockFeedScrollLandscapeTestCase

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
                             + OBJC_IVAR____TtC8StocksUI32StockFeedScrollLandscapeTestCase_aggregate);
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
  return 5;
}

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8StocksUI32StockFeedScrollLandscapeTestCase_orientation);
}

- (BOOL)waitForCommitToFinish
{
  return 0;
}

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A4A0D14(v4);
  v7 = v6;

  return v7;
}

- (_TtC8StocksUI32StockFeedScrollLandscapeTestCase)init
{
  return (_TtC8StocksUI32StockFeedScrollLandscapeTestCase *)sub_20A4A0BA0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end