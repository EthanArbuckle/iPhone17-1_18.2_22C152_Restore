@interface ExtendedLaunchToArticleTestCase
- (NSString)testName;
- (_TtC7NewsUI231ExtendedLaunchToArticleTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ExtendedLaunchToArticleTestCase

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
                             + OBJC_IVAR____TtC7NewsUI231ExtendedLaunchToArticleTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = qword_1EBAC0778;
  id v9 = a3;
  v10 = self;
  if (v8 != -1) {
    swift_once();
  }
  sub_1DFDFEA60();
  sub_1DFDF00C0();
  sub_1DFDECD40();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1DEABCF08;
  *(void *)(v11 + 24) = v7;
  swift_retain();
  sub_1DFDED5A0();

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC7NewsUI231ExtendedLaunchToArticleTestCase)init
{
  result = (_TtC7NewsUI231ExtendedLaunchToArticleTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end