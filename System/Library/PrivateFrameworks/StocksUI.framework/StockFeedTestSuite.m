@interface StockFeedTestSuite
- (_TtC8StocksUI18StockFeedTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation StockFeedTestSuite

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A86DA58(v8, (uint64_t)sub_20A4419AC, v7);

  swift_release();
}

- (_TtC8StocksUI18StockFeedTestSuite)init
{
  result = (_TtC8StocksUI18StockFeedTestSuite *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI18StockFeedTestSuite_resolver);

  swift_release();
}

@end