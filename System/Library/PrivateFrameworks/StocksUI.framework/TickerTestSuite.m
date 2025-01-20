@interface TickerTestSuite
- (_TtC8StocksUI15TickerTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation TickerTestSuite

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A675E90(v8, (uint64_t)sub_20A4419AC, v7);

  swift_release();
}

- (_TtC8StocksUI15TickerTestSuite)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SNTestSuite *)&v3 init];
}

@end