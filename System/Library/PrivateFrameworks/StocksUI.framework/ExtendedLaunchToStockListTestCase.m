@interface ExtendedLaunchToStockListTestCase
- (NSString)testName;
- (_TtC8StocksUI33ExtendedLaunchToStockListTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ExtendedLaunchToStockListTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 30.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8StocksUI33ExtendedLaunchToStockListTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A8C6670();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_20A4419AC;
  *(void *)(v10 + 24) = v7;
  swift_retain();
  v11 = (void *)sub_20A8C6450();
  sub_20A8C6590();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8StocksUI33ExtendedLaunchToStockListTestCase)init
{
  result = (_TtC8StocksUI33ExtendedLaunchToStockListTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end