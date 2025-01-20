@interface ANFGraphicalScrollAdsDisabledTestCase
- (NSString)testName;
- (_TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase)init;
- (double)timeoutInSeconds;
- (id)scrollViewWithContext:(id)a3;
- (int64_t)iterations;
- (int64_t)numberOfScreens;
- (int64_t)offset;
- (unint64_t)aggregate;
@end

@implementation ANFGraphicalScrollAdsDisabledTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_testName);
  void *v4 = 0xD000000000000024;
  v4[1] = 0x80000001DFEBAAF0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_numberOfScreens) = (Class)3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ANFGraphicalScrollAdsDisabledTestCase *)&v6 init];
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI237ANFGraphicalScrollAdsDisabledTestCase_aggregate);
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
  sub_1DEE2AA84(v4);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

@end