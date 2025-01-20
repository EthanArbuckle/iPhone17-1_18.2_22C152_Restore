@interface ForYouFeedScrollTestCase
- (NSString)testName;
- (_TtC8StocksUI24ForYouFeedScrollTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
@end

@implementation ForYouFeedScrollTestCase

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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_aggregate);
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

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A492074(v4);
  v7 = v6;

  return v7;
}

- (_TtC8StocksUI24ForYouFeedScrollTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_testName);
  *id v4 = 0xD000000000000010;
  v4[1] = 0x800000020A8FB470;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI24ForYouFeedScrollTestCase_numberOfScreens) = (Class)5;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ForYouFeedScrollTestCase *)&v6 init];
}

- (void).cxx_destruct
{
}

@end