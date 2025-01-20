@interface ForYouFeedMemoryTestSuite
- (_TtC8StocksUI25ForYouFeedMemoryTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ForYouFeedMemoryTestSuite

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A6FF86C(v8, (uint64_t)sub_20A4419AC, v7);

  swift_release();
}

- (_TtC8StocksUI25ForYouFeedMemoryTestSuite)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SNTestSuite *)&v3 init];
}

@end