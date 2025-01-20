@interface SavedFeedScrollTestCase
- (NSString)testName;
- (_TtC7NewsUI223SavedFeedScrollTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
@end

@implementation SavedFeedScrollTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7NewsUI223SavedFeedScrollTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_testName);
  void *v4 = 0x61536C6C6F726353;
  v4[1] = 0xEF64656546646576;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_numberOfScreens) = (Class)3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(SavedFeedScrollTestCase *)&v6 init];
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223SavedFeedScrollTestCase_aggregate);
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

- (id)scrollViewWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF32EAD8(v4);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

@end