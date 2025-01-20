@interface ForYouFeedMemoryTestCase
- (NSString)testName;
- (_TtC8StocksUI24ForYouFeedMemoryTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ForYouFeedMemoryTestCase

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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedMemoryTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_20A532454(v8, (uint64_t)sub_20A4419AC, v7);

  swift_release();
}

- (_TtC8StocksUI24ForYouFeedMemoryTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedMemoryTestCase_testName);
  void *v4 = 0xD000000000000010;
  v4[1] = 0x800000020A8FEFF0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedMemoryTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedMemoryTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ForYouFeedMemoryTestCase *)&v6 init];
}

- (void).cxx_destruct
{
}

@end