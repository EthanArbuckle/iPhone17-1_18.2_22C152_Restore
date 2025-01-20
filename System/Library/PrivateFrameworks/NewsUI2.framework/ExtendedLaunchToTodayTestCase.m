@interface ExtendedLaunchToTodayTestCase
- (NSString)testName;
- (_TtC7NewsUI229ExtendedLaunchToTodayTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ExtendedLaunchToTodayTestCase

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DE95E910((uint64_t)sub_1DEABCF08, v7);

  swift_release();
}

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
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
                             + OBJC_IVAR____TtC7NewsUI229ExtendedLaunchToTodayTestCase_aggregate);
}

- (_TtC7NewsUI229ExtendedLaunchToTodayTestCase)init
{
  result = (_TtC7NewsUI229ExtendedLaunchToTodayTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
}

@end