@interface PersonalizationScriptTestCase
- (NSString)testName;
- (_TtC7NewsUI229PersonalizationScriptTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation PersonalizationScriptTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI229PersonalizationScriptTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DF918E3C(v8, (uint64_t)sub_1DEABCF08, v7);

  swift_release();
}

- (_TtC7NewsUI229PersonalizationScriptTestCase)init
{
  result = (_TtC7NewsUI229PersonalizationScriptTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end